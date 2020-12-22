Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 093B52E02CA
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Dec 2020 00:05:43 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 32BFD3C574C
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Dec 2020 00:05:42 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 1F2833C2965
 for <ltp@lists.linux.it>; Tue, 22 Dec 2020 00:05:34 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 5F9BB1000B60
 for <ltp@lists.linux.it>; Tue, 22 Dec 2020 00:05:34 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8FAD9AC93;
 Mon, 21 Dec 2020 23:05:33 +0000 (UTC)
Date: Tue, 22 Dec 2020 00:05:31 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Tushar Sugandhi <tusharsu@linux.microsoft.com>
Message-ID: <20201221230531.GD4453@pevik>
References: <20200928035605.22701-1-tusharsu@linux.microsoft.com>
 <20200928035605.22701-2-tusharsu@linux.microsoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200928035605.22701-2-tusharsu@linux.microsoft.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/2] IMA: generalize key measurement tests
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: snitzer@redhat.com, nramas@linux.microsoft.com, dm-devel@redhat.com,
 ltp@lists.linux.it, linux-integrity@vger.kernel.org, gmazyland@gmail.com,
 agk@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Tushar,

I'm very sorry about the delay. I'll finish this review in January,
here just some quick thoughts (minor style nits, I'll fix it before merge).

Generally LGTM, thanks for your work.

Reviewed-by: Petr Vorel <pvorel@suse.cz>

> New functionality is being added in IMA to measure data provided by
> kernel components. Tests have to be added in LTP to validate this new
> feature. The functionality in ima_keys.sh can be reused to test this new
> feature if it is made generic.

> Refactor check_keys_policy() and test1() implemented in ima_keys.sh to
> make it generic, and move the functionality to ima_setup.sh as new
> functions - check_policy_pattern() and check_ima_ascii_log_for_policy().

> Signed-off-by: Tushar Sugandhi <tusharsu@linux.microsoft.com>
> ---
>  .../security/integrity/ima/tests/ima_keys.sh  | 62 +++------------
>  .../security/integrity/ima/tests/ima_setup.sh | 79 +++++++++++++++++++
>  2 files changed, 92 insertions(+), 49 deletions(-)

> diff --git a/testcases/kernel/security/integrity/ima/tests/ima_keys.sh b/testcases/kernel/security/integrity/ima/tests/ima_keys.sh
> index c9eef4b68..c2120358a 100755
> --- a/testcases/kernel/security/integrity/ima/tests/ima_keys.sh
> +++ b/testcases/kernel/security/integrity/ima/tests/ima_keys.sh
> @@ -6,7 +6,7 @@

>  # Verify that keys are measured correctly based on policy.

> -TST_NEEDS_CMDS="cmp cut grep sed xxd"
> +TST_NEEDS_CMDS="cmp cut grep xxd"
It still requires sed, it's just hidden in check_ima_ascii_log_for_policy

Maybe just put at the top of check_ima_ascii_log_for_policy():
tst_require_cmds cut grep sed xxd

And here still keep
TST_NEEDS_CMDS="cmp cut grep tail xxd"

This leads to duplicity in check, but it will not lead to hidden "command not
found".

>  TST_CNT=2
>  TST_NEEDS_DEVICE=1
>  TST_SETUP=setup
> @@ -28,64 +28,28 @@ cleanup()
>  	tst_is_num $KEYRING_ID && keyctl clear $KEYRING_ID
>  }

> -check_keys_policy()
> -{
> -	local pattern="$1"
> -
> -	if ! grep -E "$pattern" $TST_TMPDIR/policy.txt; then
> -		tst_res TCONF "IMA policy must specify $pattern, $FUNC_KEYCHECK, $TEMPLATE_BUF"
> -		return 1
> -	fi
> -	return 0
> -}
> -
>  # Based on https://lkml.org/lkml/2019/12/13/564.
>  # (450d0fd51564 - "IMA: Call workqueue functions to measure queued keys")
OK, it has been merged in v5.6-rc1. Any more relevant commits, changes since
then?

>  test1()
>  {
>  	local keycheck_lines i keyrings templates
>  	local pattern='keyrings=[^[:space:]]+'
> -	local test_file="file.txt" tmp_file="file2.txt"
> +	local policy="keyrings"
> +	local tmp_file="$TST_TMPDIR/keycheck_tmp_file.txt"
> +	local res
Will be unused, see below.

>  	tst_res TINFO "verify key measurement for keyrings and templates specified in IMA policy"

> -	check_keys_policy "$pattern" > $tmp_file || return
> -	keycheck_lines=$(cat $tmp_file)
> -	keyrings=$(for i in $keycheck_lines; do echo "$i" | grep "keyrings" | \
> -		sed "s/\./\\\./g" | cut -d'=' -f2; done | sed ':a;N;$!ba;s/\n/|/g')
> -	if [ -z "$keyrings" ]; then
> -		tst_res TCONF "IMA policy has a keyring key-value specifier, but no specified keyrings"
> -		return
> -	fi
> -
> -	templates=$(for i in $keycheck_lines; do echo "$i" | grep "template" | \
> -		cut -d'=' -f2; done | sed ':a;N;$!ba;s/\n/|/g')
> -
> -	tst_res TINFO "keyrings: '$keyrings'"
> -	tst_res TINFO "templates: '$templates'"
> -
> -	grep -E "($templates).*($keyrings)" $ASCII_MEASUREMENTS | while read line
> -	do
> -		local digest expected_digest algorithm
> -
> -		digest=$(echo "$line" | cut -d' ' -f4 | cut -d':' -f2)
> -		algorithm=$(echo "$line" | cut -d' ' -f4 | cut -d':' -f1)
> -		keyring=$(echo "$line" | cut -d' ' -f5)
> +	check_policy_pattern "$pattern" $FUNC_KEYCHECK $TEMPLATE_BUF > $tmp_file || return

> -		echo "$line" | cut -d' ' -f6 | xxd -r -p > $test_file
> +	res="$(check_ima_ascii_log_for_policy $policy $tmp_file)"

> -		if ! expected_digest="$(compute_digest $algorithm $test_file)"; then
> -			tst_res TCONF "cannot compute digest for $algorithm"
> -			return
> -		fi
> -
> -		if [ "$digest" != "$expected_digest" ]; then
> -			tst_res TFAIL "incorrect digest was found for $keyring keyring"
> -			return
> -		fi
> -	done
> +	if [ "$res" = "0" ]; then
> +		tst_res TPASS "specified keyrings were measured correctly"
> +	else
> +		tst_res TFAIL "failed to measure specified keyrings"
> +	fi

Instead of:
       res="$(check_ima_ascii_log_for_policy $policy $tmp_file)"
       if [ "$res" = "0" ]; then

I'd prefer to have it as:
       check_ima_ascii_log_for_policy $policy $tmp_file
       if [ $? -eq 0 ]; then


> -	tst_res TPASS "specified keyrings were measured correctly"
>  }

>  # Create a new keyring, import a certificate into it, and verify
> @@ -97,11 +61,11 @@ test2()
>  	local cert_file="$TST_DATAROOT/x509_ima.der"
>  	local keyring_name="key_import_test"
>  	local pattern="keyrings=[^[:space:]]*$keyring_name"
> -	local temp_file="file.txt"
> +	local temp_file="$TST_TMPDIR/key_import_test_file.txt"

>  	tst_res TINFO "verify measurement of certificate imported into a keyring"

> -	check_keys_policy "$pattern" >/dev/null || return
> +	check_policy_pattern "$pattern" $FUNC_KEYCHECK $TEMPLATE_BUF >/dev/null || return

>  	KEYRING_ID=$(keyctl newring $keyring_name @s) || \
>  		tst_brk TBROK "unable to create a new keyring"
> diff --git a/testcases/kernel/security/integrity/ima/tests/ima_setup.sh b/testcases/kernel/security/integrity/ima/tests/ima_setup.sh
> index 1f17aa707..2841d7df5 100644
> --- a/testcases/kernel/security/integrity/ima/tests/ima_setup.sh
> +++ b/testcases/kernel/security/integrity/ima/tests/ima_setup.sh
> @@ -54,6 +54,85 @@ compute_digest()
>  	return 1
>  }

> +check_policy_pattern()
> +{
> +	local pattern="$1"
> +	local func="$2"
> +	local template="$3"
> +
> +	if ! grep -E "$pattern" $TST_TMPDIR/policy.txt; then
> +		tst_res TCONF "IMA policy must specify $pattern, $func, $template"
> +		return 1
> +	fi
> +	return 0
> +}
Probably ok for now (yes, it removes the duplicity with function used in two
tests, it's very policy specific).

> +
> +check_ima_ascii_log_for_policy()
> +{
> +	local test_file="$TST_TMPDIR/ascii_log_test_file.txt"
> +	local grep_file="$TST_TMPDIR/ascii_log_grep_file.txt"
nit: Since the real description is in variable, I'd just use:

local test_file="$TST_TMPDIR/test.txt"
local grep_file="$TST_TMPDIR/grep.txt"

> +	local func_lines sources templates i src 
> +	local input_digest_res=1
> +	local policy_option="$1"
> +	local input_digest="$3"

tst_require_cmds cut grep sed xxd
> +
> +	func_lines=$(cat $2)
> +
> +	sources=$(for i in $func_lines; do echo "$i" | grep "$policy_option" | \
> +		sed "s/\./\\\./g" | cut -d'=' -f2; done | sed ':a;N;$!ba;s/\n/|/g')
> +	if [ -z "$sources" ]; then
> +		tst_res TCONF "IMA policy $policy_option is a key-value specifier, but no values specified"
> +		echo "1"
> +		return
> +	fi
> +
> +	templates=$(for i in $func_lines; do echo "$i" | grep "template" | \
> +		cut -d'=' -f2; done | sed ':a;N;$!ba;s/\n/|/g')
> +
> +	tst_res TINFO "policy sources: '$sources'"
> +	tst_res TINFO "templates: '$templates'"
> +
> +	grep -E "($templates).*($sources)" $ASCII_MEASUREMENTS > $grep_file
> +
> +	while read line
> +	do
> +		local digest expected_digest algorithm
> +
> +		digest=$(echo "$line" | cut -d' ' -f4 | cut -d':' -f2)
> +		algorithm=$(echo "$line" | cut -d' ' -f4 | cut -d':' -f1)
> +		src_line=$(echo "$line" | cut -d' ' -f5)
> +
> +		echo "$line" | cut -d' ' -f6 | xxd -r -p > $test_file
> +
> +		if ! expected_digest="$(compute_digest $algorithm $test_file)"; then
> +			tst_res TCONF "cannot compute digest for $algorithm"
> +			echo "1"
> +			return
> +		fi
> +
> +		if [ "$digest" != "$expected_digest" ]; then
> +			tst_res TINFO "incorrect digest was found for $src_line $policy_option"
> +			echo "1"	
> +			return
> +		fi
> +
> +		if [ "$input_digest" ]; then
> +			if [ "$digest" = "$input_digest" ]; then
> +				input_digest_res=0
> +			fi
> +		fi
I'd prefer it as single if:
        if [ -n "$input_digest" -a "$digest" = "$input_digest" ]; then
            input_digest_res=0
        fi

> +
> +	done < $grep_file
> +
> +	if [ "$input_digest" ]; then
> +		echo "$input_digest_res"
> +		return
this return is redundant.
> +	else
> +		echo "0"
> +		return
Also this one.

> +	fi

And actually, instead of whole if/else block wouldn't be just this enough?
echo "$input_digest_res"

Isn't it the zero value set in the loop at:

        if [ -n "$input_digest" -a "$digest" = "$input_digest" ]; then
            input_digest_res=0
        fi

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
