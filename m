Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5D713DEEE
	for <lists+linux-ltp@lfdr.de>; Thu, 16 Jan 2020 16:37:45 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 22A1A3C239A
	for <lists+linux-ltp@lfdr.de>; Thu, 16 Jan 2020 16:37:45 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 6EE773C2358
 for <ltp@lists.linux.it>; Thu, 16 Jan 2020 16:37:44 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id A6F30200359
 for <ltp@lists.linux.it>; Thu, 16 Jan 2020 16:37:43 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id EC8AB6A409;
 Thu, 16 Jan 2020 15:37:42 +0000 (UTC)
Date: Thu, 16 Jan 2020 16:37:42 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Rachel Sibley <rasibley@redhat.com>
Message-ID: <20200116153741.GA558@rei>
References: <cki.FA900DB853.LBD049H627@redhat.com>
 <84944fa0-3c18-f8a4-47ca-7627eb4e0594@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <84944fa0-3c18-f8a4-47ca-7627eb4e0594@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] ??? FAIL: Test report for kernel 5.4.13-rc1-7f1b863.cki
 (stable)
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
Cc: Jianwen Ji <jiji@redhat.com>, Hangbin Liu <haliu@redhat.com>,
 Memory Management <mm-qe@redhat.com>,
 Linux Stable maillist <stable@vger.kernel.org>, Jianlin Shi <jishi@redhat.com>,
 CKI Project <cki-project@redhat.com>, LTP Mailing List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > One or more kernel tests failed:
> > 
> >      ppc64le:
> >       ??? LTP
> 
> Hi, I see max_map_count failed on ppc64le:
> https://artifacts.cki-project.org/pipelines/385189/logs/ppc64le_host_2_LTP_mm.run.log

That's strange, we do attempt to map 65536 mappings but we do not touch
them, so these shouldn't be faulted in, so there is no real reason why
mmap() in the child process should stop prematurely at 65532.

I guess that we cannot do much here, unless it's reproducible, because
there is not much information there.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
