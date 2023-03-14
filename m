Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 422886B8A5C
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Mar 2023 06:32:00 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6AC153CACE5
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Mar 2023 06:31:59 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E9B303CACD6
 for <ltp@lists.linux.it>; Tue, 14 Mar 2023 06:31:57 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 3CB5E1000913
 for <ltp@lists.linux.it>; Tue, 14 Mar 2023 06:31:56 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0EA971F88F;
 Tue, 14 Mar 2023 05:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1678771915; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fCv4fiFHEsL7y1JyY0KLCCcdMg4O6TVh/yH8mAAsvws=;
 b=GpPE9XmkhtAetlPQexMclKve1/q1x7aa/0p+epbkyc77qcCsOFxSC97j/I2xK3w9vaE0pW
 0ea8z0+Nxj5kp6FA7ILc8KoZXP4YDVDi2Uw86A4ZCpIfFTY3TUWJ2vu/+2o/SSd1K4ftzC
 8YI+BDIShS0RkFapX1VfJi8clSyA/h4=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6AF18134F3;
 Tue, 14 Mar 2023 05:31:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id XgVTEcoGEGTubAAAMHmgww
 (envelope-from <wegao@suse.com>); Tue, 14 Mar 2023 05:31:54 +0000
Date: Tue, 14 Mar 2023 01:31:51 -0400
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20230314053151.GA22202@localhost>
References: <20230311023343.25177-1-wegao@suse.com>
 <20230312004420.16457-1-wegao@suse.com> <ZA7qq15aeKS+ZeJR@yuki>
 <20230313122100.GA12608@localhost> <ZA8Y+O7QFfVB0/62@yuki>
 <20230313134624.GA9783@localhost> <ZA8t7hVYRmF+I9k0@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZA8t7hVYRmF+I9k0@yuki>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] madvise11.c:Check loadable module before rmmod
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
From: Wei Gao via ltp <ltp@lists.linux.it>
Reply-To: Wei Gao <wegao@suse.com>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Mon, Mar 13, 2023 at 03:06:38PM +0100, Cyril Hrubis wrote:
> Hi!
> > > +int tst_buildin_driver(const char *driver)
> > > +{
> > > +       return !tst_search_driver(driver, "modules.buildin");
> > > +}
> > > +
> > >  int tst_check_driver(const char *driver)
> > >  {
> > >  #ifdef __ANDROID__
> > > 
> > 
> > Try use above implementation but i found another TWARN : (
> > 
> > localhost:/home/ltp/testcases/kernel/syscalls/madvise # ./madvise11
> > tst_test.c:1560: TINFO: Timeout per run is 0h 01m 00s
> > madvise11.c:396: TINFO: Spawning 5 threads, with a total of 800 memory pages
> > madvise11.c:165: TINFO: Thread [3] returned 0, succeeded.
> > madvise11.c:165: TINFO: Thread [1] returned 0, succeeded.
> > madvise11.c:165: TINFO: Thread [2] returned 0, succeeded.
> > madvise11.c:165: TINFO: Thread [4] returned 0, succeeded.
> > madvise11.c:165: TINFO: Thread [0] returned 0, succeeded.
> > madvise11.c:199: TPASS: soft-offline / mmap race still clean
> > madvise11.c:327: TWARN: open(/sys/kernel/debug/hwpoison/unpoison-pfn,1,0000) failed: ENOENT (2) !!!!
> 
> That's strange, this should be equivalent to the modinfo patch you send,
> at least the modinfo parses the same file.
> 


This is caused by "_" and "-", current search function not do this tricky translate part.
Input parameter is hwpoison_inject but actually string in modules.xxx is hwpoison-inject

/lib/modules/5.14.21-150400.24.41-default/modules.dep | grep hwpo
kernel/mm/hwpoison-inject.ko.zst:

Other info just FYI:
//modprobe can accept both "-" and "_"
localhost:/home/ltp # modprobe hwpoison-inject
localhost:/home/ltp # modprobe hwpoison_inject

//get info from lsmod and /proc use "_"
localhost:/home/ltp # lsmod | grep hwpo
hwpoison_inject        16384  0
localhost:/home/ltp # cat /proc/modules | grep hwp
hwpoison_inject 16384 0 - Live 0xffffffffc09d6000

> -- 
> Cyril Hrubis
> chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
