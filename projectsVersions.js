const child_process = require('child_process');
const fs = require('fs');

const exec = command => new Promise((resolve, reject) => child_process.exec(command, (err, stdout) => {
  if (err) {
    reject(err);
  }
  resolve(stdout.trim())
}));

const writeFile = (file, content) => new Promise((resolve, reject) => fs.writeFile(file, content, (err) => {
  if (err) {
    reject(err);
  }
  resolve();
}));

const projects = [
  'UnitTestWithPod',
  'UnitTestWithPodAPP'
]

const initVersions = {
  'UnitTestWithPod': '1.0.0',
  'UnitTestWithPodAPP': '1.0.0',
}

const types = ['feat', 'fix', 'docs', 'test', 'chore', 'perf', 'refactor', 'style']
const getRegExp = type => new RegExp(`${type}\\(?.*\\)?!`); // example: /feat\(?.*\)?!/

const changedVersion = message => {
  if (message.includes('BREAKING CHANGE') || types.some(type => getRegExp(type).test(message))) {
    return 'major';
  }
  const [minor, ...patch] = types;
  if (message.startsWith(minor)) {
    return 'minor';
  }
  if (patch.some(type => message.startsWith(type))) {
    return 'patch';
  }
}

const projectsVersions = async () => {
  const branch = await exec(`git rev-parse --abbrev-ref HEAD`);

  for (let project of projects) {
    const commandResult = await exec(`git log --pretty=:'Commit: %s' --abbrev-commit --follow -- ./${project}/`);
    const commits = commandResult.split('Commit: ').reverse()
    let [major, minor, patch] = initVersions[project].split('.').map(item => Number(item));

    for (let commit of commits) {
      switch (changedVersion(commit)) {
        case 'major':
          [major, minor, patch] = [major += 1, 0, 0];
          break;
        case 'minor':
          [minor, patch] = [minor + 1, 0];
          break;
        case 'patch':
          patch += 1;
          break;
      }

      const version = [major, minor, patch].join('.') + (branch === 'master' ? '' : `-${branch}`);
      await writeFile(`./${project}/VERSION`, version);
    }
  }
}

projectsVersions().then(() => {});
