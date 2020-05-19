Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C9B1D99E1
	for <lists+linux-ltp@lfdr.de>; Tue, 19 May 2020 16:34:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 626163C4E67
	for <lists+linux-ltp@lfdr.de>; Tue, 19 May 2020 16:34:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id C6CBC3C0271
 for <ltp@lists.linux.it>; Tue, 19 May 2020 16:34:23 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 765F260080D
 for <ltp@lists.linux.it>; Tue, 19 May 2020 16:33:59 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 139DEACAE;
 Tue, 19 May 2020 14:34:25 +0000 (UTC)
Date: Tue, 19 May 2020 16:34:50 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Xiao Yang <yangx.jy@cn.fujitsu.com>
Message-ID: <20200519143450.GF16008@yuki.lan>
References: <20200518054335.12017-1-yangx.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200518054335.12017-1-yangx.jy@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] lib/tst_test.c: Take account of
 tst_brk(TCONF)/tst_brk(TFAIL) in summary output
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
>  lib/tst_test.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/lib/tst_test.c b/lib/tst_test.c
> index 0e58060e0..b28521a67 100644
> --- a/lib/tst_test.c
> +++ b/lib/tst_test.c
> @@ -316,6 +316,7 @@ void tst_vbrk_(const char *file, const int lineno, int ttype,
>                 const char *fmt, va_list va)
>  {
>  	print_result(file, lineno, ttype, fmt, va);
> +	update_results(TTYPE_RESULT(ttype));
>  
>  	/*
>  	 * The getpid implementation in some C library versions may cause cloned

Good catch, but I guess that we should also remove the update_result()
call from the run_tcases_per_fs() after this.

And it also makes sense to call the function as a first thing in the
tst_res_/tst_brk_ function, which simplifies the code flow.

So I guess that we want something like this (not tested):

diff --git a/lib/tst_test.c b/lib/tst_test.c
index 0e58060e0..9d0ef672d 100644
--- a/lib/tst_test.c
+++ b/lib/tst_test.c
@@ -278,8 +278,6 @@ void tst_vres_(const char *file, const int lineno, int ttype,
                const char *fmt, va_list va)
 {
        print_result(file, lineno, ttype, fmt, va);
-
-       update_results(TTYPE_RESULT(ttype));
 }
 
 void tst_vbrk_(const char *file, const int lineno, int ttype,
@@ -297,7 +295,6 @@ static void tst_cvres(const char *file, const int lineno, int ttype,
        }
 
        print_result(file, lineno, ttype, fmt, va);
-       update_results(TTYPE_RESULT(ttype));
 }
 
 static void do_test_cleanup(void)
@@ -337,6 +334,8 @@ void tst_res_(const char *file, const int lineno, int ttype,
 {
        va_list va;
 
+       update_results(TTYPE_RESULT(ttype));
+
        va_start(va, fmt);
        tst_vres_(file, lineno, ttype, fmt, va);
        va_end(va);
@@ -347,6 +346,8 @@ void tst_brk_(const char *file, const int lineno, int ttype,
 {
        va_list va;
 
+       update_results(TTYPE_RESULT(ttype));
+
        va_start(va, fmt);
        tst_brk_handler(file, lineno, ttype, fmt, va);
        va_end(va);
@@ -1316,10 +1317,8 @@ static int run_tcases_per_fs(void)
                        mntpoint_mounted = 0;
                }
 
-               if (ret == TCONF) {
-                       update_results(ret);
+               if (ret == TCONF)
                        continue;
-               }
 
                if (ret == 0)
                        continue;


-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
