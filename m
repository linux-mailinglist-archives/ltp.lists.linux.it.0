Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD323FFB3D
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Sep 2021 09:44:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8CBCC3C28F4
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Sep 2021 09:44:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 812BF3C2836
 for <ltp@lists.linux.it>; Fri,  3 Sep 2021 09:43:59 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 0EA9F140125A
 for <ltp@lists.linux.it>; Fri,  3 Sep 2021 09:43:57 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EC49F20014;
 Fri,  3 Sep 2021 07:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1630655036;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hp3iFvHd8jJfW8q9bvntFmMyGnV9sZB7W9BI6W4ZkM4=;
 b=ouvYGaOifuSlk2Q0suV43890Hp8nNRzCgSc2HSGGToRfIKUdsqG+aEGMUVJpiaEsE0Wi5u
 aKEg7Ph0FVgp9x4bEmHwHwS0+rbuHZfqZaanXe6Aus6e/Ln+FosEsEZm/vndALachH3pr2
 yV5//umBM16bVdUm2j27YfOe+GnrNZY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1630655036;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hp3iFvHd8jJfW8q9bvntFmMyGnV9sZB7W9BI6W4ZkM4=;
 b=NMNmytXsvI6eA50Ldg+AM/6+RHg2H2y8K8VIZ+toFPEHNLRcMvD0zvp+XnVsxm5ARQcA1G
 AWSnUgyWtHV4I2Cg==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id B24D6131F5;
 Fri,  3 Sep 2021 07:43:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id +UKnKTzSMWFKZQAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Fri, 03 Sep 2021 07:43:56 +0000
Date: Fri, 3 Sep 2021 09:43:55 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <YTHSO4IQ+Qn1Fo8l@pevik>
References: <20210902103740.19446-1-pvorel@suse.cz>
 <015140e9-0eba-4057-4a91-35d958af2bb8@jv-coder.de>
 <YTDpQxDDPY3HCli6@pevik>
 <16028467-ecd5-ecc0-26d7-b7a617045970@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <16028467-ecd5-ecc0-26d7-b7a617045970@jv-coder.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 0/4] checkbashisms.pl in make check + fixed docs
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Joerg,

> H Petr,

> On 9/2/2021 5:09 PM, Petr Vorel wrote:

> > > $ checkbashisms testcases/kernel/connectors/pec/cn_pec.sh
> > > possible bashism in testcases/kernel/connectors/pec/cn_pec.sh line 127
> > > (should be >word 2>&1):
> > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 done <&${fd_act}
> > > This one is just a false positive and I have no clue how to prevent t=
his.
> > > I think the script does not like the <&, but this is posix...
> > The same here, I'm not sure if it's POSIX. &> definitely is not POSIX.
> > I remember we were talking about it. Can we avoid it somehow?
> <&n is the only way to use the file handle n for input. <n would use the
> file n.
> See: https://pubs.opengroup.org/onlinepubs/009604499/utilities/xcu_chap02=
.html#tag_02_07_05

> checkbashisms has no problems if n is a number, not a variable. There is
> nothing in the standard about n being a variable, but I guess this should=
 be
> posix as well.
> Furthermore the suggested fix "(should be >word 2>&1)" clearly shows, that
> checkbashisms thinks, this is &>.
Agree, it's very likely checkbashims bug which should be fixed.

> I don't see another way to implement this (but using an implementation in
> c). And I am not really happy to bend my code around bugs in a tool, that=
 is
> supposed to ensure better code.
+1
> I'd rather try to fix checkbashims in this case. Even the ((-case should =
be
> fixed, after checking if it is posix. The suggestion (replace with "$((")
> indicates at least a bug in the tool.
I'll try to search for $(( )) in POSIX docs.

What is the outcome? Should I first fix checkbashisms before merging these?
I suggest to merge it for local checking (similar to checkpatch.pl for C).
Because it cannot be used in CI right now, not even because these 2 false
positives, but because not everything has been converted to use new shell A=
PI.

> To be honest, I am a bit disappointed from this tool. It doesn't seem to =
be
> tested very well... Probably barely good enough for scripting in the kern=
el.
This tool comes from Debian, written long time ago (2009) for release goal =
to
use dash as /bin/sh [1] [2]. Kernel developers usually don't care about POS=
IX
shell and happily use /bin/bash with all arrays and other crazy bashisms.

There is tool shellcheck, which IMHO has a lot of false positives (I suppose
Cyril agrees with it, as he added checkbashisms to our docs long time ago) =
and
we both aren't happy about occasional patches which are based on it's outpu=
t.
See full output below for comparison. E.g. in "In POSIX sh, 'local' is unde=
fined" is
useless, if we decide to trust local, at least for "local msg" i.e. without
assignment. Or other not useful for us:
SC2166: Prefer [ p ] && [ q ] as [ p -a q ] is not well defined.

Not sure about: TST_ARGS=3D"$@":
SC2124: Assigning an array to a string! Assign as array, or use * instead o=
f @ to concatenate.

The only good thing about shellcheck is that it has full shell parser [3],
unlike checkbashisms.

Kind regards,
Petr

[1] https://lwn.net/Articles/343924/
[2] https://lwn.net/Articles/343614/
[3] https://unix.stackexchange.com/questions/667288/checkbashisms-whats-wro=
ng-with-type/667293#comment1257178_667293

$ shellcheck -x tst_ansi_color.sh tst_test.sh

In tst_ansi_color.sh line 9:
	local ansi_color_blue=3D'\033[1;34m'
        ^-------------------^ SC3043: In POSIX sh, 'local' is undefined.


In tst_ansi_color.sh line 10:
	local ansi_color_green=3D'\033[1;32m'
        ^--------------------^ SC3043: In POSIX sh, 'local' is undefined.


In tst_ansi_color.sh line 11:
	local ansi_color_magenta=3D'\033[1;35m'
        ^----------------------^ SC3043: In POSIX sh, 'local' is undefined.


In tst_ansi_color.sh line 12:
	local ansi_color_red=3D'\033[1;31m'
        ^------------------^ SC3043: In POSIX sh, 'local' is undefined.


In tst_ansi_color.sh line 13:
	local ansi_color_yellow=3D'\033[1;33m'
        ^---------------------^ SC3043: In POSIX sh, 'local' is undefined.


In tst_ansi_color.sh line 16:
	TPASS) printf $ansi_color_green;;
                      ^---------------^ SC2059: Don't use variables in the =
printf format string. Use printf '..%s..' "$foo".
                      ^---------------^ SC2086: Double quote to prevent glo=
bbing and word splitting.

Did you mean: =

	TPASS) printf "$ansi_color_green";;


In tst_ansi_color.sh line 17:
	TFAIL) printf $ansi_color_red;;
                      ^-------------^ SC2059: Don't use variables in the pr=
intf format string. Use printf '..%s..' "$foo".
                      ^-------------^ SC2086: Double quote to prevent globb=
ing and word splitting.

Did you mean: =

	TFAIL) printf "$ansi_color_red";;


In tst_ansi_color.sh line 18:
	TBROK) printf $ansi_color_red;;
                      ^-------------^ SC2059: Don't use variables in the pr=
intf format string. Use printf '..%s..' "$foo".
                      ^-------------^ SC2086: Double quote to prevent globb=
ing and word splitting.

Did you mean: =

	TBROK) printf "$ansi_color_red";;


In tst_ansi_color.sh line 19:
	TWARN) printf $ansi_color_magenta;;
                      ^-----------------^ SC2059: Don't use variables in th=
e printf format string. Use printf '..%s..' "$foo".
                      ^-----------------^ SC2086: Double quote to prevent g=
lobbing and word splitting.

Did you mean: =

	TWARN) printf "$ansi_color_magenta";;


In tst_ansi_color.sh line 20:
	TINFO) printf $ansi_color_blue;;
                      ^--------------^ SC2059: Don't use variables in the p=
rintf format string. Use printf '..%s..' "$foo".
                      ^--------------^ SC2086: Double quote to prevent glob=
bing and word splitting.

Did you mean: =

	TINFO) printf "$ansi_color_blue";;


In tst_ansi_color.sh line 21:
	TCONF) printf $ansi_color_yellow;;
                      ^----------------^ SC2059: Don't use variables in the=
 printf format string. Use printf '..%s..' "$foo".
                      ^----------------^ SC2086: Double quote to prevent gl=
obbing and word splitting.

Did you mean: =

	TCONF) printf "$ansi_color_yellow";;


In tst_ansi_color.sh line 36:
	local color=3D$?
        ^---------^ SC3043: In POSIX sh, 'local' is undefined.


In tst_ansi_color.sh line 39:
	printf "$2"
               ^--^ SC2059: Don't use variables in the printf format string=
. Use printf '..%s..' "$foo".


In tst_test.sh line 29:
	local ret=3D0
        ^-------^ SC3043: In POSIX sh, 'local' is undefined.


In tst_test.sh line 32:
	if [ -n "$TST_DO_CLEANUP" -a -n "$TST_CLEANUP" -a -z "$TST_NO_CLEANUP" ]; =
then
                                  ^-- SC2166: Prefer [ p ] && [ q ] as [ p =
-a q ] is not well defined.
                                                       ^-- SC2166: Prefer [=
 p ] && [ q ] as [ p -a q ] is not well defined.


In tst_test.sh line 33:
		if type $TST_CLEANUP >/dev/null 2>/dev/null; then
                        ^----------^ SC2086: Double quote to prevent globbi=
ng and word splitting.

Did you mean: =

		if type "$TST_CLEANUP" >/dev/null 2>/dev/null; then


In tst_test.sh line 40:
	if [ "$TST_NEEDS_DEVICE" =3D 1 -a "$TST_DEVICE_FLAG" =3D 1 ]; then
                                     ^-- SC2166: Prefer [ p ] && [ q ] as [=
 p -a q ] is not well defined.


In tst_test.sh line 46:
	if [ "$TST_NEEDS_TMPDIR" =3D 1 -a -n "$TST_TMPDIR" ]; then
                                     ^-- SC2166: Prefer [ p ] && [ q ] as [=
 p -a q ] is not well defined.


In tst_test.sh line 47:
		cd "$LTPROOT"
                ^-----------^ SC2164: Use 'cd ... || exit' or 'cd ... || re=
turn' in case cd fails.

Did you mean: =

		cd "$LTPROOT" || exit


In tst_test.sh line 52:
	if [ -n "$TST_NEEDS_CHECKPOINTS" -a -f "$LTP_IPC_PATH" ]; then
                                         ^-- SC2166: Prefer [ p ] && [ q ] =
as [ p -a q ] is not well defined.


In tst_test.sh line 53:
		rm $LTP_IPC_PATH
                   ^-----------^ SC2086: Double quote to prevent globbing a=
nd word splitting.

Did you mean: =

		rm "$LTP_IPC_PATH"


In tst_test.sh line 70:
	if [ $TST_CONF -gt 0 -a $TST_PASS -eq 0 ]; then
                             ^-- SC2166: Prefer [ p ] && [ q ] as [ p -a q =
] is not well defined.


In tst_test.sh line 74:
	if [ $TST_BROK -gt 0 -o $TST_FAIL -gt 0 -o $TST_WARN -gt 0 ]; then
                             ^-- SC2166: Prefer [ p ] || [ q ] as [ p -o q =
] is not well defined.
                                                ^-- SC2166: Prefer [ p ] ||=
 [ q ] as [ p -o q ] is not well defined.


In tst_test.sh line 104:
	local res=3D$1
        ^-------^ SC3043: In POSIX sh, 'local' is undefined.


In tst_test.sh line 108:
	local color=3D$?
        ^---------^ SC3043: In POSIX sh, 'local' is undefined.


In tst_test.sh line 112:
	printf "$TST_ID $TST_COUNT " >&2
               ^-------------------^ SC2059: Don't use variables in the pri=
ntf format string. Use printf '..%s..' "$foo".


In tst_test.sh line 113:
	tst_print_colored $res "$res: " >&2
                          ^--^ SC2086: Double quote to prevent globbing and=
 word splitting.

Did you mean: =

	tst_print_colored "$res" "$res: " >&2


In tst_test.sh line 119:
	local res=3D$1
        ^-------^ SC3043: In POSIX sh, 'local' is undefined.


In tst_test.sh line 133:
	local tst_out
        ^-----------^ SC3043: In POSIX sh, 'local' is undefined.


In tst_test.sh line 135:
	tst_out=3D"$(tst_rod $@ 2>&1)"
                           ^-- SC2068: Double quote array expansions to avo=
id re-splitting elements.


In tst_test.sh line 136:
	if [ $? -ne 0 ]; then
             ^-- SC2181: Check exit code directly with e.g. 'if mycmd;', no=
t indirectly with $?.


In tst_test.sh line 138:
		tst_brk TBROK "$@ failed"
                               ^-- SC2145: Argument mixes string and array.=
 Use * or separate argument.


In tst_test.sh line 145:
	if [ $? -ne 0 ]; then
             ^-- SC2181: Check exit code directly with e.g. 'if mycmd;', no=
t indirectly with $?.


In tst_test.sh line 146:
		tst_brk TBROK "$@ failed"
                               ^-- SC2145: Argument mixes string and array.=
 Use * or separate argument.


In tst_test.sh line 152:
	local fnc=3D"$1"
        ^-------^ SC3043: In POSIX sh, 'local' is undefined.


In tst_test.sh line 156:
	if [ $? -eq 0 ]; then
             ^-- SC2181: Check exit code directly with e.g. 'if mycmd;', no=
t indirectly with $?.


In tst_test.sh line 157:
		tst_res TPASS "$@ passed as expected"
                               ^-- SC2145: Argument mixes string and array.=
 Use * or separate argument.


In tst_test.sh line 160:
		$fnc TFAIL "$@ failed unexpectedly"
                            ^-- SC2145: Argument mixes string and array. Us=
e * or separate argument.


In tst_test.sh line 167:
	local fnc=3D"$1"
        ^-------^ SC3043: In POSIX sh, 'local' is undefined.


In tst_test.sh line 172:
	if [ $? -ne 0 ]; then
             ^-- SC2181: Check exit code directly with e.g. 'if mycmd;', no=
t indirectly with $?.


In tst_test.sh line 173:
		tst_res TPASS "$@ failed as expected"
                               ^-- SC2145: Argument mixes string and array.=
 Use * or separate argument.


In tst_test.sh line 176:
		$fnc TFAIL "$@ passed unexpectedly"
                            ^-- SC2145: Argument mixes string and array. Us=
e * or separate argument.


In tst_test.sh line 203:
	local tst_fun=3D"$1"
        ^-----------^ SC3043: In POSIX sh, 'local' is undefined.


In tst_test.sh line 204:
	local tst_exp=3D$2
        ^-----------^ SC3043: In POSIX sh, 'local' is undefined.


In tst_test.sh line 205:
	local tst_sec=3D$(($3 * 1000000))
        ^-----------^ SC3043: In POSIX sh, 'local' is undefined.


In tst_test.sh line 206:
	local tst_delay=3D1
        ^-------------^ SC3043: In POSIX sh, 'local' is undefined.


In tst_test.sh line 232:
	return $tst_exp
               ^------^ SC2086: Double quote to prevent globbing and word s=
plitting.

Did you mean: =

	return "$tst_exp"


In tst_test.sh line 242:
	return $2
               ^-- SC2086: Double quote to prevent globbing and word splitt=
ing.

Did you mean: =

	return "$2"


In tst_test.sh line 247:
	local msg1=3D"RTNETLINK answers: Function not implemented"
        ^--------^ SC3043: In POSIX sh, 'local' is undefined.


In tst_test.sh line 248:
	local msg2=3D"RTNETLINK answers: Operation not supported"
        ^--------^ SC3043: In POSIX sh, 'local' is undefined.


In tst_test.sh line 249:
	local msg3=3D"RTNETLINK answers: Protocol not supported"
        ^--------^ SC3043: In POSIX sh, 'local' is undefined.


In tst_test.sh line 250:
	local output=3D"$($@ 2>&1 || echo 'LTP_ERR')"
        ^----------^ SC3043: In POSIX sh, 'local' is undefined.
              ^----^ SC2155: Declare and assign separately to avoid masking=
 return values.
                        ^-- SC2068: Double quote array expansions to avoid =
re-splitting elements.


In tst_test.sh line 251:
	local msg
        ^-------^ SC3043: In POSIX sh, 'local' is undefined.


In tst_test.sh line 256:
		echo "$output" | grep -q "$msg" && tst_brk TCONF "'$@': $msg"
                                                                   ^-- SC21=
45: Argument mixes string and array. Use * or separate argument.


In tst_test.sh line 259:
	tst_brk TBROK "$@ failed: $output"
                       ^-- SC2145: Argument mixes string and array. Use * o=
r separate argument.


In tst_test.sh line 285:
	local mnt_opt mnt_err
        ^-------------------^ SC3043: In POSIX sh, 'local' is undefined.


In tst_test.sh line 292:
	ROD_SILENT mkdir -p $TST_MNTPOINT
                            ^-----------^ SC2086: Double quote to prevent g=
lobbing and word splitting.

Did you mean: =

	ROD_SILENT mkdir -p "$TST_MNTPOINT"


In tst_test.sh line 293:
	mount $mnt_opt $TST_DEVICE $TST_MNTPOINT $TST_MNT_PARAMS
              ^------^ SC2086: Double quote to prevent globbing and word sp=
litting.
                       ^---------^ SC2086: Double quote to prevent globbing=
 and word splitting.
                                   ^-----------^ SC2086: Double quote to pr=
event globbing and word splitting.
                                                 ^-------------^ SC2086: Do=
uble quote to prevent globbing and word splitting.

Did you mean: =

	mount "$mnt_opt" "$TST_DEVICE" "$TST_MNTPOINT" "$TST_MNT_PARAMS"


In tst_test.sh line 294:
	local ret=3D$?
        ^-------^ SC3043: In POSIX sh, 'local' is undefined.


In tst_test.sh line 307:
	local mntpoint=3D"${1:-$TST_MNTPOINT}"
        ^------------^ SC3043: In POSIX sh, 'local' is undefined.


In tst_test.sh line 308:
	local i=3D0
        ^-----^ SC3043: In POSIX sh, 'local' is undefined.


In tst_test.sh line 340:
	local fs_type=3D${1:-$TST_FS_TYPE}
        ^-----------^ SC3043: In POSIX sh, 'local' is undefined.


In tst_test.sh line 341:
	local device=3D${2:-$TST_DEVICE}
        ^----------^ SC3043: In POSIX sh, 'local' is undefined.


In tst_test.sh line 344:
	local fs_opts=3D"$@"
        ^-----------^ SC3043: In POSIX sh, 'local' is undefined.
                      ^--^ SC2124: Assigning an array to a string! Assign a=
s array, or use * instead of @ to concatenate.


In tst_test.sh line 354:
	tst_require_cmds mkfs.$fs_type
                              ^------^ SC2086: Double quote to prevent glob=
bing and word splitting.

Did you mean: =

	tst_require_cmds mkfs."$fs_type"


In tst_test.sh line 357:
	ROD_SILENT mkfs.$fs_type $fs_opts $device
                        ^------^ SC2086: Double quote to prevent globbing a=
nd word splitting.
                                 ^------^ SC2086: Double quote to prevent g=
lobbing and word splitting.
                                          ^-----^ SC2086: Double quote to p=
revent globbing and word splitting.

Did you mean: =

	ROD_SILENT mkfs."$fs_type" "$fs_opts" "$device"


In tst_test.sh line 366:
	local v
        ^-----^ SC3043: In POSIX sh, 'local' is undefined.


In tst_test.sh line 372:
	[ $? -eq 0 ] || return 1
          ^-- SC2181: Check exit code directly with e.g. 'if mycmd;', not i=
ndirectly with $?.


In tst_test.sh line 380:
	command -v $1 >/dev/null 2>&1
                   ^-- SC2086: Double quote to prevent globbing and word sp=
litting.

Did you mean: =

	command -v "$1" >/dev/null 2>&1


In tst_test.sh line 385:
	local cmd
        ^-------^ SC3043: In POSIX sh, 'local' is undefined.


In tst_test.sh line 386:
	for cmd in $*; do
                   ^-- SC2048: Use "$@" (with quotes) to prevent whitespace=
 problems.


In tst_test.sh line 387:
		tst_cmd_available $cmd || tst_brk TCONF "'$cmd' not found"
                                  ^--^ SC2086: Double quote to prevent glob=
bing and word splitting.

Did you mean: =

		tst_cmd_available "$cmd" || tst_brk TCONF "'$cmd' not found"


In tst_test.sh line 393:
	local cmd
        ^-------^ SC3043: In POSIX sh, 'local' is undefined.


In tst_test.sh line 394:
	for cmd in $*; do
                   ^-- SC2048: Use "$@" (with quotes) to prevent whitespace=
 problems.


In tst_test.sh line 395:
		if ! tst_cmd_available $cmd; then
                                       ^--^ SC2086: Double quote to prevent=
 globbing and word splitting.

Did you mean: =

		if ! tst_cmd_available "$cmd"; then


In tst_test.sh line 407:
	local drv
        ^-------^ SC3043: In POSIX sh, 'local' is undefined.


In tst_test.sh line 409:
	drv=3D"$(tst_check_drivers $@ 2>&1)"
                                 ^-- SC2068: Double quote array expansions =
to avoid re-splitting elements.


In tst_test.sh line 411:
	[ $? -ne 0 ] && tst_brk TCONF "$drv driver not available"
          ^-- SC2181: Check exit code directly with e.g. 'if mycmd;', not i=
ndirectly with $?.


In tst_test.sh line 446:
	local res=3D$(_tst_resstr)
        ^-------^ SC3043: In POSIX sh, 'local' is undefined.
              ^-^ SC2155: Declare and assign separately to avoid masking re=
turn values.


In tst_test.sh line 460:
	local err=3D"LTP_TIMEOUT_MUL must be number >=3D 1!"
        ^-------^ SC3043: In POSIX sh, 'local' is undefined.


In tst_test.sh line 471:
	[ "$timeout" -ge 1 ] || tst_brk TBROK "timeout need to be >=3D 1 ($timeout=
)"
           ^------^ SC2154: timeout is referenced but not assigned.


In tst_test.sh line 479:
	local i=3D10
        ^-----^ SC3043: In POSIX sh, 'local' is undefined.


In tst_test.sh line 483:
	kill -TERM -$pid
                    ^--^ SC2086: Double quote to prevent globbing and word =
splitting.

Did you mean: =

	kill -TERM -"$pid"


In tst_test.sh line 486:
	while kill -0 $pid >/dev/null 2>&1 && [ $i -gt 0 ]; do
                      ^--^ SC2086: Double quote to prevent globbing and wor=
d splitting.

Did you mean: =

	while kill -0 "$pid" >/dev/null 2>&1 && [ $i -gt 0 ]; do


In tst_test.sh line 492:
	if kill -0 $pid >/dev/null 2>&1; then
                   ^--^ SC2086: Double quote to prevent globbing and word s=
plitting.

Did you mean: =

	if kill -0 "$pid" >/dev/null 2>&1; then


In tst_test.sh line 494:
		kill -KILL -$pid
                            ^--^ SC2086: Double quote to prevent globbing a=
nd word splitting.

Did you mean: =

		kill -KILL -"$pid"


In tst_test.sh line 501:
		kill -TERM $_tst_setup_timer_pid 2>/dev/null
                           ^-------------------^ SC2086: Double quote to pr=
event globbing and word splitting.

Did you mean: =

		kill -TERM "$_tst_setup_timer_pid" 2>/dev/null


In tst_test.sh line 502:
		wait $_tst_setup_timer_pid 2>/dev/null
                     ^-------------------^ SC2086: Double quote to prevent =
globbing and word splitting.

Did you mean: =

		wait "$_tst_setup_timer_pid" 2>/dev/null


In tst_test.sh line 508:
	local sleep_pid
        ^-------------^ SC3043: In POSIX sh, 'local' is undefined.


In tst_test.sh line 510:
	sleep $sec &
              ^--^ SC2086: Double quote to prevent globbing and word splitt=
ing.

Did you mean: =

	sleep "$sec" &


In tst_test.sh line 512:
	trap "kill $sleep_pid; exit" TERM
                   ^--------^ SC2064: Use single quotes, otherwise this exp=
ands now rather than when signalled.


In tst_test.sh line 531:
	local sec=3D$TST_TIMEOUT
        ^-------^ SC3043: In POSIX sh, 'local' is undefined.


In tst_test.sh line 533:
	local h=3D$((sec / 3600))
        ^-----^ SC3043: In POSIX sh, 'local' is undefined.


In tst_test.sh line 534:
	local m=3D$((sec / 60 % 60))
        ^-----^ SC3043: In POSIX sh, 'local' is undefined.


In tst_test.sh line 535:
	local s=3D$((sec % 60))
        ^-----^ SC3043: In POSIX sh, 'local' is undefined.


In tst_test.sh line 536:
	local pid=3D$$
        ^-------^ SC3043: In POSIX sh, 'local' is undefined.


In tst_test.sh line 556:
	local _tst_module=3D$1
        ^---------------^ SC3043: In POSIX sh, 'local' is undefined.


In tst_test.sh line 583:
	local pagesize
        ^------------^ SC3043: In POSIX sh, 'local' is undefined.


In tst_test.sh line 587:
	if [ $? -ne 0 ]; then
             ^-- SC2181: Check exit code directly with e.g. 'if mycmd;', no=
t indirectly with $?.


In tst_test.sh line 597:
	local _tst_i
        ^----------^ SC3043: In POSIX sh, 'local' is undefined.


In tst_test.sh line 598:
	local _tst_data
        ^-------------^ SC3043: In POSIX sh, 'local' is undefined.


In tst_test.sh line 599:
	local _tst_max
        ^------------^ SC3043: In POSIX sh, 'local' is undefined.


In tst_test.sh line 600:
	local _tst_name
        ^-------------^ SC3043: In POSIX sh, 'local' is undefined.


In tst_test.sh line 603:
		for _tst_i in $(grep '^[^#]*\bTST_' "$TST_TEST_PATH" | sed 's/.*TST_//; s=
/[=3D"} \t\/:`].*//'); do
                              ^-- SC2013: To read lines rather than words, =
pipe/redirect to a 'while read' loop.


In tst_test.sh line 621:
		for _tst_i in $(grep '^[^#]*\b_tst_' "$TST_TEST_PATH" | sed 's/.*_tst_//;=
 s/[=3D"} \t\/:`].*//'); do
                              ^-- SC2013: To read lines rather than words, =
pipe/redirect to a 'while read' loop.


In tst_test.sh line 628:
	while getopts ":hi:$TST_OPTS" _tst_name $TST_ARGS; do
                                                ^-------^ SC2086: Double qu=
ote to prevent globbing and word splitting.

Did you mean: =

	while getopts ":hi:$TST_OPTS" _tst_name "$TST_ARGS"; do


In tst_test.sh line 650:
	tst_require_cmds $TST_NEEDS_CMDS
                         ^-------------^ SC2086: Double quote to prevent gl=
obbing and word splitting.

Did you mean: =

	tst_require_cmds "$TST_NEEDS_CMDS"


In tst_test.sh line 651:
	tst_require_drivers $TST_NEEDS_DRIVERS
                            ^----------------^ SC2086: Double quote to prev=
ent globbing and word splitting.

Did you mean: =

	tst_require_drivers "$TST_NEEDS_DRIVERS"


In tst_test.sh line 673:
		cd "$TST_TMPDIR"
                ^--------------^ SC2164: Use 'cd ... || exit' or 'cd ... ||=
 return' in case cd fails.

Did you mean: =

		cd "$TST_TMPDIR" || exit


In tst_test.sh line 681:
		if [ ! -b "$TST_DEVICE" -o $? -ne 0 ]; then
                                        ^-- SC2166: Prefer [ p ] || [ q ] a=
s [ p -o q ] is not well defined.
                                           ^-- SC2181: Check exit code dire=
ctly with e.g. 'if mycmd;', not indirectly with $?.


In tst_test.sh line 694:
		if type $TST_SETUP >/dev/null 2>/dev/null; then
                        ^--------^ SC2086: Double quote to prevent globbing=
 and word splitting.

Did you mean: =

		if type "$TST_SETUP" >/dev/null 2>/dev/null; then


In tst_test.sh line 703:
	while [ $TST_ITERATIONS -gt 0 ]; do
                ^-------------^ SC2086: Double quote to prevent globbing an=
d word splitting.

Did you mean: =

	while [ "$TST_ITERATIONS" -gt 0 ]; do


In tst_test.sh line 706:
			_tst_max=3D$(( $(echo $TST_TEST_DATA | tr -cd "$TST_TEST_DATA_IFS" | wc =
-c) +1))
                                            ^------------^ SC2086: Double q=
uote to prevent globbing and word splitting.

Did you mean: =

			_tst_max=3D$(( $(echo "$TST_TEST_DATA" | tr -cd "$TST_TEST_DATA_IFS" | w=
c -c) +1))


In tst_test.sh line 708:
				_tst_data=3D"$(echo "$TST_TEST_DATA" | cut -d"$TST_TEST_DATA_IFS" -f$_t=
st_i)"
                                                                           =
                       ^-----^ SC2086: Double quote to prevent globbing and=
 word splitting.

Did you mean: =

				_tst_data=3D"$(echo "$TST_TEST_DATA" | cut -d"$TST_TEST_DATA_IFS" -f"$_=
tst_i")"


In tst_test.sh line 721:
	local _tst_data=3D"$1"
        ^-------------^ SC3043: In POSIX sh, 'local' is undefined.


In tst_test.sh line 722:
	local _tst_i
        ^----------^ SC3043: In POSIX sh, 'local' is undefined.


In tst_test.sh line 725:
	for _tst_i in $(seq ${TST_CNT:-1}); do
                            ^-----------^ SC2086: Double quote to prevent g=
lobbing and word splitting.

Did you mean: =

	for _tst_i in $(seq "${TST_CNT:-1}"); do


In tst_test.sh line 726:
		if type ${TST_TESTFUNC}1 > /dev/null 2>&1; then
                        ^-------------^ SC2086: Double quote to prevent glo=
bbing and word splitting.

Did you mean: =

		if type "${TST_TESTFUNC}"1 > /dev/null 2>&1; then


In tst_test.sh line 727:
			_tst_run_test "$TST_TESTFUNC$_tst_i" $_tst_i "$_tst_data"
                                                             ^-----^ SC2086=
: Double quote to prevent globbing and word splitting.

Did you mean: =

			_tst_run_test "$TST_TESTFUNC$_tst_i" "$_tst_i" "$_tst_data"


In tst_test.sh line 729:
			_tst_run_test "$TST_TESTFUNC" $_tst_i "$_tst_data"
                                                      ^-----^ SC2086: Doubl=
e quote to prevent globbing and word splitting.

Did you mean: =

			_tst_run_test "$TST_TESTFUNC" "$_tst_i" "$_tst_data"


In tst_test.sh line 736:
	local _tst_res=3D$(_tst_resstr)
        ^------------^ SC3043: In POSIX sh, 'local' is undefined.
              ^------^ SC2155: Declare and assign separately to avoid maski=
ng return values.


In tst_test.sh line 737:
	local _tst_fnc=3D"$1"
        ^------------^ SC3043: In POSIX sh, 'local' is undefined.


In tst_test.sh line 746:
	_tst_filename=3D$(basename $0) || \
                                 ^-- SC2086: Double quote to prevent globbi=
ng and word splitting.

Did you mean: =

	_tst_filename=3D$(basename "$0") || \


In tst_test.sh line 760:
	if TST_TEST_PATH=3D$(command -v $0) 2>/dev/null; then
                                      ^-- SC2086: Double quote to prevent g=
lobbing and word splitting.

Did you mean: =

	if TST_TEST_PATH=3D$(command -v "$0") 2>/dev/null; then


In tst_test.sh line 792:
	TST_ARGS=3D"$@"
                 ^--^ SC2124: Assigning an array to a string! Assign as arr=
ay, or use * instead of @ to concatenate.


In tst_test.sh line 804:
		if [ -z "$TST_PRINT_HELP" -a $# -ne "$TST_POS_ARGS" ]; then
                                          ^-- SC2166: Prefer [ p ] && [ q ]=
 as [ p -a q ] is not well defined.


In tst_test.sh line 806:
					  "have ($@) $#, expected ${TST_POS_ARGS}"
                                                 ^-- SC2145: Argument mixes=
 string and array. Use * or separate argument.


In tst_test.sh line 809:
		if [ -z "$TST_PRINT_HELP" -a $# -ne 0 ]; then
                                          ^-- SC2166: Prefer [ p ] && [ q ]=
 as [ p -a q ] is not well defined.


In tst_test.sh line 810:
			tst_brk TBROK "Unexpected positional arguments '$@'"
                                                                        ^--=
 SC2145: Argument mixes string and array. Use * or separate argument.

For more information:
  https://www.shellcheck.net/wiki/SC2068 -- Double quote array expansions t=
o ...
  https://www.shellcheck.net/wiki/SC2145 -- Argument mixes string and array=
. ...
  https://www.shellcheck.net/wiki/SC2048 -- Use "$@" (with quotes) to preve=
nt...

> Joerg

-- =

Mailing list info: https://lists.linux.it/listinfo/ltp
