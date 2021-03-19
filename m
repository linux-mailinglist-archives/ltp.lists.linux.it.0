Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F8E341DEC
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Mar 2021 14:15:05 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B48293C5FD5
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Mar 2021 14:15:04 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 939333C5FBD
 for <ltp@lists.linux.it>; Fri, 19 Mar 2021 14:15:02 +0100 (CET)
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id A891360102B
 for <ltp@lists.linux.it>; Fri, 19 Mar 2021 14:15:01 +0100 (CET)
Received: by mail-pf1-x436.google.com with SMTP id y5so5876670pfn.1
 for <ltp@lists.linux.it>; Fri, 19 Mar 2021 06:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
 :references; bh=J4+PATZB/dnRz/i4aUV+ihAd6hea4g72bgHNjue2Ckw=;
 b=tHXCDkblIeiQFh6bDHNXIkKHfbILB3vbJSFc/WzBqixEgiQRNvwvGSA0oj71A/i4W2
 RwIQX3a6H5irhHbD+LKcjXteR1oamHDuUGnD1kc6SCEPQGnYp+px6TuFjgZTmL4nG41y
 1aYJQmkKGOeYIbupDw9xjrwORkLvYEx49pc2YLpRmiOO+C2py0Hd+Vc38szIlpl4Xsj7
 aoe7KwfAL6TNuSbZs5wGOPFLkDklK1PaN6KtT0HErC3GHbrjbQNhwbv5Miw0c1Hg+HDD
 8s49WNATGhyOGF1kpSdCCILj9E2PcIQkMvAtqBI7g2yZaCts2kmzHN/eHPqYbLM+0P3o
 Cmdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:message-id:mime-version:subject:date
 :in-reply-to:cc:to:references;
 bh=J4+PATZB/dnRz/i4aUV+ihAd6hea4g72bgHNjue2Ckw=;
 b=pBFNXKM6RhLfjHxHpEf9HCXPbBU49yFtrDbgdCEQ2XGgnfud6TPj2wdWJcZARWnx1k
 wviJ1Y3HHeiFD3ZLTvBKxCLj5vPlv4U5l5OLVNXdeN0RcB2VUQ9oUUCchwGt/V10leGl
 wNCXwHA85d3UAnjreJgVnhPZqLuI9eFpBFsQ+h2n4WW5kGzz2CsSDJfOVzwCXkMzEQ1y
 j5iC7VrdbLplbhQW3Hzbj/LF8nztzzwSjEbNGfTJESmaA00dph4MZmfXUaXVxT1qiUTf
 0cqTk1ipk19Vj0FY3Lt5Hhvk2edOff3WROVt5oQagloSqVC+U7JHsh5o6j4RdPL0QrAE
 lkIg==
X-Gm-Message-State: AOAM5333IUGJOCuw/xC/cU/r9WO9U/iVNF57KKtd5r6rlFzlNEfVVK+l
 u9bPPZId6XJPHNl3h9bNlto=
X-Google-Smtp-Source: ABdhPJwU1F19zwQqHxONveB+wNuHW0Hw1+Ry4DdzTEetNEJoQu2hssaJl72gCC/bTpRTu9Y0epJppw==
X-Received: by 2002:a65:458f:: with SMTP id o15mr11126896pgq.111.1616159700152; 
 Fri, 19 Mar 2021 06:15:00 -0700 (PDT)
Received: from ?IPv6:2400:2411:d20:8500:75bf:6929:a40a:5b?
 ([2400:2411:d20:8500:75bf:6929:a40a:5b])
 by smtp.gmail.com with ESMTPSA id y17sm5700220pju.50.2021.03.19.06.14.58
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 19 Mar 2021 06:14:59 -0700 (PDT)
From: Fuli QI <fukuri.sai@gmail.com>
X-Google-Original-From: Fuli QI <Fukuri.Sai@gmail.com>
Message-Id: <DE272918-850F-4087-AC08-FCD8699A58E4@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Date: Fri, 19 Mar 2021 22:14:57 +0900
In-Reply-To: <05259ae9-4687-028d-48f0-929a43c2feec@163.com>
To: Xiao Yang <ice_yangxiao@163.com>
References: <20210319115934.1801692-1-qi.fuli@fujitsu.com>
 <05259ae9-4687-028d-48f0-929a43c2feec@163.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/swapon/swapon0{1..3}: remove checking if
 fs type is BTRFS
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
Cc: QI Fuli <qi.fuli@fujitsu.com>, ltp@lists.linux.it
Content-Type: multipart/mixed; boundary="===============0467708655=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


--===============0467708655==
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_6B8247DF-9EA5-4902-959A-F439986C82DD"


--Apple-Mail=_6B8247DF-9EA5-4902-959A-F439986C82DD
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hi,

> On Mar 19, 2021, at 22:05, Xiao Yang <ice_yangxiao@163.com> wrote:
>=20
> Hi Qi,
>=20
> Can we rename subject to 'Remove the check for BTRFS'?

Yes.

>=20
> On 3/19/21 7:59 PM, QI Fuli wrote:
>> remove redundant tasks as BTRFS is checked in is_swap_supported()
>> Fixes: caf453532("syscalls/swapon/swapon0{1..3}: use helpers to check
>> 	support status")
>>=20
>> Signed-off-by: QI Fuli <qi.fuli@fujitsu.com>
>> ---
>>  testcases/kernel/syscalls/swapon/swapon01.c |  7 -------
>>  testcases/kernel/syscalls/swapon/swapon02.c |  5 -----
>>  testcases/kernel/syscalls/swapon/swapon03.c | 15 +--------------
>>  3 files changed, 1 insertion(+), 26 deletions(-)
>>=20
>> diff --git a/testcases/kernel/syscalls/swapon/swapon01.c =
b/testcases/kernel/syscalls/swapon/swapon01.c
>> index f95ce0ab2..aff842e4c 100644
>> --- a/testcases/kernel/syscalls/swapon/swapon01.c
>> +++ b/testcases/kernel/syscalls/swapon/swapon01.c
>> @@ -32,18 +32,11 @@ static void cleanup(void);
>>  char *TCID =3D "swapon01";
>>  int TST_TOTAL =3D 1;
>>=20
>> -static long fs_type;
>> -
>>  static void verify_swapon(void)
>>  {
>>  	TEST(ltp_syscall(__NR_swapon, "./swapfile01", 0));
>>=20
>>  	if (TEST_RETURN =3D=3D -1) {
>> -		if (fs_type =3D=3D TST_BTRFS_MAGIC && errno =3D=3D =
EINVAL) {
>> -			tst_brkm(TCONF, cleanup,
>> -			         "Swapfile on BTRFS not implemeted");
>> -			return;
>> -		}
>>  		tst_resm(TFAIL | TTERRNO, "Failed to turn on swapfile");
>>  	} else {
>>  		tst_resm(TPASS, "Succeeded to turn on swapfile");
>> diff --git a/testcases/kernel/syscalls/swapon/swapon02.c =
b/testcases/kernel/syscalls/swapon/swapon02.c
>> index 3d49d0c6b..653b1f33e 100644
>> --- a/testcases/kernel/syscalls/swapon/swapon02.c
>> +++ b/testcases/kernel/syscalls/swapon/swapon02.c
>> @@ -81,11 +81,6 @@ static void verify_swapon(struct test_case_t =
*test)
>>  		return;
>>  	}
>>=20
>> -	if (fs_type =3D=3D TST_BTRFS_MAGIC && errno =3D=3D EINVAL) {
>> -		tst_resm(TCONF, "Swapfile on BTRFS not implemeted");
>> -			return;
>> -	}
>> -
>=20
> Hi Qi,
>=20
> The following check for btrfs can be removed as well:
>=20
> -------------------------------------------------------------
>=20
> static void setup(void)
> {
> ...
>         if (ltp_syscall(__NR_swapon, "alreadyused", 0)) {
>                 if (fs_type !=3D TST_BTRFS_MAGIC || errno !=3D EINVAL)
>                         tst_resm(TWARN | TERRNO, "swapon(alreadyused) =
failed");
> ...
>=20
> -------------------------------------------------------------
>=20
> Note: also remove fs_type variable.
>=20
> Other than these, it looks good to me.
>=20
> Best Regards,
>=20
> Xiao Yang

Ok, I got it.
I will send a v2 patch.

Thank you very much.

QI


>=20
>>  	tst_resm(TFAIL, "swapon(2) failed to produce expected error:"
>>  	         " %d, errno: %s and got %d.", test->exp_errno,
>>  	         test->exp_errval, TEST_ERRNO);
>> diff --git a/testcases/kernel/syscalls/swapon/swapon03.c =
b/testcases/kernel/syscalls/swapon/swapon03.c
>> index cef57150c..19455bfe6 100644
>> --- a/testcases/kernel/syscalls/swapon/swapon03.c
>> +++ b/testcases/kernel/syscalls/swapon/swapon03.c
>> @@ -52,8 +52,6 @@ int TST_TOTAL =3D 1;
>>=20
>>  static int swapfiles;
>>=20
>> -static long fs_type;
>> -
>>  int testfiles =3D 3;
>>  static struct swap_testfile_t {
>>  	char *filename;
>> @@ -215,9 +213,6 @@ static int setup_swap(void)
>>  			/* turn on the swap file */
>>  			res =3D ltp_syscall(__NR_swapon, filename, 0);
>>  			if (res !=3D 0) {
>> -				if (fs_type =3D=3D TST_BTRFS_MAGIC && =
errno =3D=3D EINVAL)
>> -					exit(2);
>> -
>>  				if (errno =3D=3D EPERM) {
>>  					printf("Successfully created %d =
"
>>  					       "swapfiles\n", j);
>> @@ -233,16 +228,8 @@ static int setup_swap(void)
>>  	} else
>>  		waitpid(pid, &status, 0);
>>=20
>> -	switch (WEXITSTATUS(status)) {
>> -	case 0:
>> -	break;
>> -	case 2:
>> -		tst_brkm(TCONF, cleanup, "Swapfile on BTRFS not =
implemeted");
>> -	break;
>> -	default:
>> +	if (WEXITSTATUS(status) =3D=3D 1)
>>  		tst_brkm(TFAIL, cleanup, "Failed to setup swaps");
>> -	break;
>> -	}
>>=20
>>  	/* Create all needed extra swapfiles for testing */
>>  	for (j =3D 0; j < testfiles; j++)
>> --
>> 2.29.2


--Apple-Mail=_6B8247DF-9EA5-4902-959A-F439986C82DD
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" =
class=3D"">Hi,<br class=3D""><div><br class=3D""><blockquote type=3D"cite"=
 class=3D""><div class=3D"">On Mar 19, 2021, at 22:05, Xiao Yang &lt;<a =
href=3D"mailto:ice_yangxiao@163.com" =
class=3D"">ice_yangxiao@163.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><meta =
charset=3D"UTF-8" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">Hi Qi,</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">Can we rename subject to 'Remove the check for =
BTRFS'?</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""></div></blockquote><div><br =
class=3D""></div><div>Yes.</div><br class=3D""><blockquote type=3D"cite" =
class=3D""><div class=3D""><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">On 3/19/21 7:59 PM, QI Fuli wrote:</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" =
class=3D""><blockquote type=3D"cite" style=3D"font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">remove =
redundant tasks as BTRFS is checked in is_swap_supported()<br =
class=3D"">Fixes: caf453532("syscalls/swapon/swapon0{1..3}: use helpers =
to check<br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>support status")<br class=3D""><br =
class=3D"">Signed-off-by: QI Fuli &lt;<a =
href=3D"mailto:qi.fuli@fujitsu.com" =
class=3D"">qi.fuli@fujitsu.com</a>&gt;<br class=3D"">---<br =
class=3D"">&nbsp;testcases/kernel/syscalls/swapon/swapon01.c | &nbsp;7 =
-------<br class=3D"">&nbsp;testcases/kernel/syscalls/swapon/swapon02.c =
| &nbsp;5 -----<br =
class=3D"">&nbsp;testcases/kernel/syscalls/swapon/swapon03.c | 15 =
+--------------<br class=3D"">&nbsp;3 files changed, 1 insertion(+), 26 =
deletions(-)<br class=3D""><br class=3D"">diff --git =
a/testcases/kernel/syscalls/swapon/swapon01.c =
b/testcases/kernel/syscalls/swapon/swapon01.c<br class=3D"">index =
f95ce0ab2..aff842e4c 100644<br class=3D"">--- =
a/testcases/kernel/syscalls/swapon/swapon01.c<br class=3D"">+++ =
b/testcases/kernel/syscalls/swapon/swapon01.c<br class=3D"">@@ -32,18 =
+32,11 @@ static void cleanup(void);<br class=3D"">&nbsp;char *TCID =3D =
"swapon01";<br class=3D"">&nbsp;int TST_TOTAL =3D 1;<br class=3D""><br =
class=3D"">-static long fs_type;<br class=3D"">-<br =
class=3D"">&nbsp;static void verify_swapon(void)<br class=3D"">&nbsp;{<br =
class=3D"">&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>TEST(ltp_syscall(__NR_swapon, "./swapfile01", 0));<br =
class=3D""><br class=3D"">&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>if (TEST_RETURN =3D=3D -1) {<br =
class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>if (fs_type =3D=3D TST_BTRFS_MAGIC &amp;&amp; errno =3D=3D =
EINVAL) {<br class=3D"">-<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>tst_brkm(TCONF, cleanup,<br =
class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;"Swapfile on BTRFS not implemeted");<br =
class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>return;<br class=3D"">-<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>}<br class=3D"">&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>tst_resm(TFAIL | TTERRNO, "Failed to turn on swapfile");<br =
class=3D"">&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>} else {<br class=3D"">&nbsp;<span class=3D"Apple-tab-span"=
 style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>tst_resm(TPASS, "Succeeded to =
turn on swapfile");<br class=3D"">diff --git =
a/testcases/kernel/syscalls/swapon/swapon02.c =
b/testcases/kernel/syscalls/swapon/swapon02.c<br class=3D"">index =
3d49d0c6b..653b1f33e 100644<br class=3D"">--- =
a/testcases/kernel/syscalls/swapon/swapon02.c<br class=3D"">+++ =
b/testcases/kernel/syscalls/swapon/swapon02.c<br class=3D"">@@ -81,11 =
+81,6 @@ static void verify_swapon(struct test_case_t *test)<br =
class=3D"">&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>return;<br class=3D"">&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>}<br class=3D""><br =
class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>if (fs_type =3D=3D TST_BTRFS_MAGIC &amp;&amp; errno =3D=3D =
EINVAL) {<br class=3D"">-<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>tst_resm(TCONF, "Swapfile on =
BTRFS not implemeted");<br class=3D"">-<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>return;<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>}<br =
class=3D"">-<br class=3D""></blockquote><br style=3D"caret-color: rgb(0, =
0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">Hi Qi,</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">The following check for btrfs can be removed as =
well:</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" =
class=3D"">-------------------------------------------------------------</=
span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">static void =
setup(void)</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">{</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">...</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if =
(ltp_syscall(__NR_swapon, "alreadyused", 0)) {</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; if (fs_type !=3D TST_BTRFS_MAGIC || errno !=3D=
 EINVAL)</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; tst_resm(TWARN | TERRNO, "swapon(alreadyused) failed");</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">...</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" =
class=3D"">-------------------------------------------------------------</=
span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">Note: also =
remove fs_type variable.</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">Other than these, it looks good to me.</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">Best Regards,</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">Xiao Yang</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" =
class=3D""></div></blockquote><div><br class=3D""></div><div>Ok, I got =
it.</div><div>I will send a v2 patch.</div><div><br =
class=3D""></div><div>Thank you very much.</div><div><br =
class=3D""></div><div>QI</div><div><br class=3D""></div><br =
class=3D""><blockquote type=3D"cite" class=3D""><div class=3D""><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" =
class=3D""><blockquote type=3D"cite" style=3D"font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" =
class=3D"">&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>tst_resm(TFAIL, "swapon(2) failed to produce expected =
error:"<br class=3D"">&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;" %d, errno: %s and got %d.", test-&gt;exp_errno,<br =
class=3D"">&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;test-&gt;exp_errval, TEST_ERRNO);<br class=3D"">diff =
--git a/testcases/kernel/syscalls/swapon/swapon03.c =
b/testcases/kernel/syscalls/swapon/swapon03.c<br class=3D"">index =
cef57150c..19455bfe6 100644<br class=3D"">--- =
a/testcases/kernel/syscalls/swapon/swapon03.c<br class=3D"">+++ =
b/testcases/kernel/syscalls/swapon/swapon03.c<br class=3D"">@@ -52,8 =
+52,6 @@ int TST_TOTAL =3D 1;<br class=3D""><br class=3D"">&nbsp;static =
int swapfiles;<br class=3D""><br class=3D"">-static long fs_type;<br =
class=3D"">-<br class=3D"">&nbsp;int testfiles =3D 3;<br =
class=3D"">&nbsp;static struct swap_testfile_t {<br class=3D"">&nbsp;<span=
 class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>char =
*filename;<br class=3D"">@@ -215,9 +213,6 @@ static int =
setup_swap(void)<br class=3D"">&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>/* turn on the swap file */<br =
class=3D"">&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>res =3D ltp_syscall(__NR_swapon, filename, 0);<br =
class=3D"">&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>if (res !=3D 0) {<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>if =
(fs_type =3D=3D TST_BTRFS_MAGIC &amp;&amp; errno =3D=3D EINVAL)<br =
class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>exit(2);<br class=3D"">-<br class=3D"">&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>if (errno =
=3D=3D EPERM) {<br class=3D"">&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>printf("Successfully created %d =
"<br class=3D"">&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space:=
 pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;"swapfiles\n", j);<br class=3D"">@@ -233,16 +228,8 @@ static int =
setup_swap(void)<br class=3D"">&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>} else<br class=3D"">&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>waitpid(pid, &amp;status, 0);<br class=3D""><br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>switch =
(WEXITSTATUS(status)) {<br class=3D"">-<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>case 0:<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>break;<br =
class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>case 2:<br class=3D"">-<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>tst_brkm(TCONF, cleanup, =
"Swapfile on BTRFS not implemeted");<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>break;<br =
class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>default:<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>if (WEXITSTATUS(status) =3D=3D =
1)<br class=3D"">&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>tst_brkm(TFAIL, cleanup, "Failed =
to setup swaps");<br class=3D"">-<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>break;<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>}<br =
class=3D""><br class=3D"">&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>/* Create all needed extra =
swapfiles for testing */<br class=3D"">&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>for (j =3D =
0; j &lt; testfiles; j++)<br class=3D"">--<br =
class=3D"">2.29.2</blockquote></div></blockquote></div><br =
class=3D""></body></html>=

--Apple-Mail=_6B8247DF-9EA5-4902-959A-F439986C82DD--

--===============0467708655==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0467708655==--
