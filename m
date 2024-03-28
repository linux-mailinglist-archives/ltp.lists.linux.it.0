Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F7A8716A9
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Mar 2024 08:20:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1709623237; h=to : date :
 message-id : in-reply-to : references : mime-version : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=Jung6TGdxpc9GpJL3cxNVNk/yA494fKRSCiT29eZN2s=;
 b=bgooKPxIZ5/5w15XmiS2K9SgDj3TZG+Kt5HtGnPvyLGiCxzcJMveD8zD/wPmmR1qIKxmK
 fTArQJOfFLY+zY+7wJ4a4bKuc/Uxzy6B+lwreJZDG0Vd1NyVhoWLy1yH0ihN96+628YtHQC
 azHlginDlMv5pCFAHf/9YckgkJqz4ao=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9AF8E3CE9FA
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Mar 2024 08:20:37 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B408B3CAECE
 for <ltp@lists.linux.it>; Tue,  5 Mar 2024 08:20:33 +0100 (CET)
Authentication-Results: in-6.smtp.seeweb.it; spf=pass (sender SPF authorized)
 smtp.mailfrom=baidu.com (client-ip=220.181.3.85; helo=baidu.com;
 envelope-from=xuwenjie04@baidu.com; receiver=lists.linux.it)
Received: from baidu.com (mx21.baidu.com [220.181.3.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id EC5D2140099E
 for <ltp@lists.linux.it>; Tue,  5 Mar 2024 08:20:29 +0100 (CET)
To: <pvorel@suse.cz>
Date: Tue, 5 Mar 2024 15:20:14 +0800
Message-ID: <20240305072014.55145-1-xuwenjie04@baidu.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240301124129.GE1661970@pevik>
References: <20240301124129.GE1661970@pevik>
MIME-Version: 1.0
X-Originating-IP: [10.127.73.8]
X-ClientProxiedBy: BC-Mail-Ex09.internal.baidu.com (172.31.51.49) To
 BJHW-MAIL-EX28.internal.baidu.com (10.127.64.43)
X-FEAS-Client-IP: 10.127.64.11
X-FE-Policy-ID: 15:10:21:SYSTEM
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] pipe/pipe15.c: Adjust fd check for pipe creation
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
From: Wenjie Xu via ltp <ltp@lists.linux.it>
Reply-To: Wenjie Xu <xuwenjie04@baidu.com>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> HI Wenjie, Marius,
>
> > A pipe occupies 2 fds, and considering 3 standard fds,
> > we should compare rlim_max with such *2+3 calculated value
> > to verify whether the maximum file descriptor configuration
> > of the current machine is sufficient.
> 
> Indeed, 1024*2+3 is the lowest number which passes with non-default ulimit:
> 
> ulimit -n $((1024*2+3)) && ./pipe15
> 
> Therefore I merged, thank you!
> 
> BTW I wonder how did you encounter this?
 
In my test case, the system ulimit is set to 10240,
and the calculated pipe_count is also 10240, causing
the EMFILE failure when creating the pipe below.

> @Marius FYI I also fixed SIGSEGV when low ulimit, see
> https://github.com/linux-test-project/ltp/commit/fc6adb8454df34fa87b462844b740cc3a0b84caa
>
> > Signed-off-by: Wenjie Xu <xuwenjie04@baidu.com>
> > ---
> > testcases/kernel/syscalls/pipe/pipe15.c | 2 +-
> > 1 file changed, 1 insertion(+), 1 deletion(-)

> > diff --git a/testcases/kernel/syscalls/pipe/pipe15.c b/testcases/kernel/syscalls/pipe/pipe15.c
> > index c85ad1820..9e02fe2eb 100644
> > --- a/testcases/kernel/syscalls/pipe/pipe15.c
> > +++ b/testcases/kernel/syscalls/pipe/pipe15.c
> > @@ -59,7 +59,7 @@ static void setup(void)
> >       tst_res(TINFO, "Creating %i pipes", pipe_count);
> 
> >       SAFE_GETRLIMIT(RLIMIT_NOFILE, &nfd);
> > -     if (nfd.rlim_max < (unsigned long)pipe_count)
> > +    if (nfd.rlim_max < (unsigned long)pipe_count * 2 + 3)
> nit: you mixed tabs with spaces or broke indent. And patch was not applicable
> (even before my changes), therefore I needed to do the changes myself and thus I
> put my fix fc6adb845 ("pipe15: Avoid SIGSEGV in cleanup") before.
> 
> Kind regards,
> Petr
>
> >              tst_brk(TCONF, "NOFILE limit max too low: %lu < %i", nfd.rlim_max, pipe_count);
> >       if (nfd.rlim_cur < nfd.rlim_max) {
> >              nfd.rlim_cur = nfd.rlim_max;

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
