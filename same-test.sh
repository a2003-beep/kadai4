#!/bin/bash

./same.sh a 0 > /kadai4/result-$$

echo "error" > /kadai4/ans-$$

diff /kadai4/ans-$$ /kadai4/result-$$ || exit1




