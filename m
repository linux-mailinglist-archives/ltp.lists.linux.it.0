Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5131FAB88
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Jun 2020 10:44:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9BDF13C2CFB
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Jun 2020 10:44:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 0688C3C1360
 for <ltp@lists.linux.it>; Tue, 16 Jun 2020 10:44:12 +0200 (CEST)
Received: from Galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 8BD7A1022AFB
 for <ltp@lists.linux.it>; Tue, 16 Jun 2020 10:44:12 +0200 (CEST)
Received: from [5.158.153.52] (helo=nanos.tec.linutronix.de)
 by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <tglx@linutronix.de>)
 id 1jl7CK-0008N3-TL; Tue, 16 Jun 2020 10:44:00 +0200
Received: by nanos.tec.linutronix.de (Postfix, from userid 1000)
 id 72FEA10154B; Tue, 16 Jun 2020 10:44:00 +0200 (CEST)
From: Thomas Gleixner <tglx@linutronix.de>
To: kernel test robot <rong.a.chen@intel.com>
In-Reply-To: <20200616075533.GL5653@shao2-debian>
References: <20200616075533.GL5653@shao2-debian>
Date: Tue, 16 Jun 2020 10:44:00 +0200
Message-ID: <87y2onbdtb.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [x86/entry] 2bbc68f837: ltp.ptrace08.fail
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
Cc: Alexandre Chartre <alexandre.chartre@oracle.com>,
 Peter Zijlstra <peterz@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 lkp@lists.01.org, Andy Lutomirski <luto@kernel.org>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

kernel test robot <rong.a.chen@intel.com> writes:
> FYI, we noticed the following commit (built with gcc-9):
>
> commit: 2bbc68f8373c0631ebf137f376fbea00e8086be7 ("x86/entry: Convert Debug exception to IDTENTRY_DB")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

Is the head of linux.git exposing the same problem or is this an
intermittent failure, which only affects bisectability?

Thanks,

        tglx

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
