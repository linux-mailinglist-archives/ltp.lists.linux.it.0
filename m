Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 073BBFD9F5
	for <lists+linux-ltp@lfdr.de>; Fri, 15 Nov 2019 10:52:40 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CA4FE3C2380
	for <lists+linux-ltp@lfdr.de>; Fri, 15 Nov 2019 10:52:39 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id B83033C2337
 for <ltp@lists.linux.it>; Fri, 15 Nov 2019 10:52:36 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 273EB1400DD5
 for <ltp@lists.linux.it>; Fri, 15 Nov 2019 10:52:35 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 85873B139;
 Fri, 15 Nov 2019 09:52:35 +0000 (UTC)
Date: Fri, 15 Nov 2019 10:52:34 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20191115095234.GA18488@rei.lan>
References: <cki.ECB352932E.9FL0Q68EC2@redhat.com>
 <232041279.11531466.1573491604178.JavaMail.zimbra@redhat.com>
 <976393725.11648955.1573552572246.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <976393725.11648955.1573552572246.JavaMail.zimbra@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] ??? FAIL: Test report for kernel 5.4.0-rc6-dd89262.cki
 (mainline.kernel.org)
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
Cc: Memory Management <mm-qe@redhat.com>, LTP Mailing List <ltp@lists.linux.it>,
 CKI Project <cki-project@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > perf_event_open02 again:
> 
> I have a system [1] where it's consistently reproducible.
> It looks like count_hardware_counters() reports incorrect number.
> time_enabled and time_running are different but only barely (~0.7%).
> 
> # ./perf_event_open02 -v
> at iteration:0 value:300357893 time_enabled:55368608 time_running:55368608
> at iteration:1 value:600712498 time_enabled:54808179 time_running:54403148
> perf_event_open02    0  TINFO  :  overall task clock: 54825931
> perf_event_open02    0  TINFO  :  hw sum: 1442538620, task clock sum: 260919342
> hw counters: 288507724 288507724 288507724 288507724 288507724
> task clock counters: 51773047 52526664 52531694 52540386 51547551
> perf_event_open02    0  TINFO  :  ratio: 4.759050
> perf_event_open02    1  TFAIL  :  perf_event_open02.c:394: test failed (ratio was greater than )
> 
> Also do_work() completes pretty fast compared to a different host:
> 
> real	0m0.176s
> user	0m0.163s
> sys	0m0.003s

I was thinking of setting up an CPU time alarm that would stop that loop
so that it will run for reasonably defined length regardless the CPU
speed...

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
