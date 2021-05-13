Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5238D37F27D
	for <lists+linux-ltp@lfdr.de>; Thu, 13 May 2021 07:09:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9E6F73C4BA9
	for <lists+linux-ltp@lfdr.de>; Thu, 13 May 2021 07:09:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9033A3C209F
 for <ltp@lists.linux.it>; Thu, 13 May 2021 07:08:57 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 74B161401196
 for <ltp@lists.linux.it>; Thu, 13 May 2021 07:08:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620882535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lotr3KD/b6c7XUL3IGbRHTcuJYGqMq9xbaCdtbeGm7E=;
 b=CLaG97wNMr+dihd0tghK1NlzY1O4lbMOgkJP2YNQLSOF5KoT3iy4HQrorS4pfv9hzahtNy
 HB3k+2w6XxR8O0I73+tsgMX0eJxeEDJ2ODP51BwooIMITbAtBzqJLQbFGoJKGULIkfC+Kq
 VMy1RWJeQtv1G/pNE4CZ+U2IHUdB+tA=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-Wud47RLRO_2xg3f0c_iqbg-1; Thu, 13 May 2021 01:08:53 -0400
X-MC-Unique: Wud47RLRO_2xg3f0c_iqbg-1
Received: by mail-yb1-f198.google.com with SMTP id
 l9-20020a5b0b890000b02904f7fb53ca12so31029683ybq.15
 for <ltp@lists.linux.it>; Wed, 12 May 2021 22:08:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lotr3KD/b6c7XUL3IGbRHTcuJYGqMq9xbaCdtbeGm7E=;
 b=UFS1z8g8MzgmO1IJVzRtgsmb9UwjpY7lWKUMByqIlX/wtlqwqxpnVtQpQ6ptHm97o8
 wPm0FBVdu6nWpM9TDFwOIqLNd3suHEaBiz+1MxvVdYRvTRPkAJqhxxYOi0xrkgrDDmJK
 4uopCGWyl/3pA+IAWkC9lMrkxBX7k1PLlCUm0AaeD+G/ghC2I9vJxzmxp1uj3W1wYlXQ
 RCsaLMXJiSgdrF8K+lpiYmp0QSO42+18n8cYS8wzYbLKoVCHytGrczk5ER86D1AMY1Jj
 Ku4MvcDq84Lc+s6mH2hIEhj4b4HtimcaQUyMIUkFBm5xeH5kJQK8DngLN34QWUS8Mvnx
 YK2Q==
X-Gm-Message-State: AOAM530PIcQB1MjkB//w/JcQ378GFhMnhaCe8BkmTIRbGmmHMkqjw1Ay
 4UW/cezSb6L/AmsGy141UODw44obN4IFGMoR+BEDjrsD6kDi5nyscQbC2R4+ensHuZpiZs/EvMU
 YzTB7iSjikWqKC/mS4ZubtCUTgyU=
X-Received: by 2002:a25:1455:: with SMTP id 82mr52796977ybu.403.1620882532622; 
 Wed, 12 May 2021 22:08:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxDnSq/u32JwYZn6ox3vNP9oZ2EENXHsB+8GvvJoURoPr2YgN1VYKwKkeVvdK0vbe4GSetKV8fhmRvEi57AX4c=
X-Received: by 2002:a25:1455:: with SMTP id 82mr52796948ybu.403.1620882532267; 
 Wed, 12 May 2021 22:08:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210508055109.16914-4-liwang@redhat.com>
 <dfdd8e9a-90ca-642d-1c21-da169ca3878f@jv-coder.de>
 <CAEemH2et8_SXWJTsofdt7gc0NRV=91rPe0RtAMt1BX=SbAzhig@mail.gmail.com>
 <YJvkFTUWS2iuZ00H@pevik>
In-Reply-To: <YJvkFTUWS2iuZ00H@pevik>
From: Li Wang <liwang@redhat.com>
Date: Thu, 13 May 2021 13:08:40 +0800
Message-ID: <CAEemH2fRLqipQWTxVsakYNGsmQT+2X8_xzgepCiAY1O8YWtKFA@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 3/4] lib: ignore SIGINT in _tst_kill_test
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> FYI I tried to use both SIGINT and SIGTERM, but there was some problem.
> But I guess it was my error. Please *add* SIGTERM (keep SIGINT).

Yes, we'd better keep SIGINT for ctrl^c action and use SIGTERM
additionally for process terminating.

Does this below (rough solution in my mind) work for you?

diff --git a/lib/newlib_tests/shell/timeout03.sh
b/lib/newlib_tests/shell/timeout03.sh
index cd548d9a2..f39f5712a 100755
--- a/lib/newlib_tests/shell/timeout03.sh
+++ b/lib/newlib_tests/shell/timeout03.sh
@@ -30,6 +30,7 @@ TST_TIMEOUT=1

 do_test()
 {
+       trap "echo 'Sorry, timeout03 is still alive'" TERM
        tst_res TINFO "testing killing test after TST_TIMEOUT"

        sleep 2
diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
index 28c2052d6..d7c9791e9 100644
--- a/testcases/lib/tst_test.sh
+++ b/testcases/lib/tst_test.sh
@@ -21,7 +21,7 @@ export TST_LIB_LOADED=1
 . tst_security.sh

 # default trap function
-trap "tst_brk TBROK 'test interrupted or timed out'" INT
+trap "tst_brk TBROK 'test interrupted'" INT

 _tst_do_exit()
 {
@@ -439,18 +439,18 @@ _tst_kill_test()
 {
        local i=10

-       trap '' INT
-       tst_res TBROK "Test timeouted, sending SIGINT! If you are
running on slow machine, try exporting LTP_TIMEOUT_MUL > 1"
-       kill -INT -$pid
+       trap '' TERM
+       tst_res TBROK "Test timeouted, sending SIGTERM! If you are
running on slow machine, try exporting LTP_TIMEOUT_MUL > 1"
+       kill -TERM -$pid
        tst_sleep 100ms

-       while kill -0 $pid 2>&1 > /dev/null && [ $i -gt 0 ]; do
+       while kill -0 $pid &>/dev/null && [ $i -gt 0 ]; do
                tst_res TINFO "Test is still running, waiting ${i}s"
                sleep 1
                i=$((i-1))
        done

-       if kill -0 $pid 2>&1 > /dev/null; then
+       if kill -0 $pid &>/dev/null; then
                tst_res TBROK "Test still running, sending SIGKILL"
                kill -KILL -$pid
        fi


-- 
Regards,
Li Wang


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
