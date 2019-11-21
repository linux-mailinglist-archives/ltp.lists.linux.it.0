Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E95C5104F42
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Nov 2019 10:31:56 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A48C93C1CA6
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Nov 2019 10:31:56 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 1B0783C1C8B
 for <ltp@lists.linux.it>; Thu, 21 Nov 2019 10:31:54 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 2F3B56170A9
 for <ltp@lists.linux.it>; Thu, 21 Nov 2019 10:31:52 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4303EAE39;
 Thu, 21 Nov 2019 09:31:52 +0000 (UTC)
Date: Thu, 21 Nov 2019 10:31:50 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Rachel Sibley <rasibley@redhat.com>
Message-ID: <20191121093150.GA14186@rei.lan>
References: <cki.6D94BD5731.3IAGHB25D8@redhat.com>
 <20191120113534.GC14963@rei.lan>
 <57f8e29e-1d49-e93f-2b03-75a3fd3e6e21@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <57f8e29e-1d49-e93f-2b03-75a3fd3e6e21@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] ??? FAIL: Test report for kernel 5.4.0-rc8-4b17a56.cki
 (stable-next)
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
 Linux Stable maillist <stable@vger.kernel.org>,
 CKI Project <cki-project@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> >> One or more kernel tests failed:
> >>
> >>      ppc64le:
> >>       ??? LTP lite
> >>       ??? xfstests: ext4
> > 
> > Both logs shows missing files, that may be an infrastructure problem as
> > well.
> > 
> > Also can we include links to the logfiles here? Bonus points for showing
> > the snippet with the actual failure in the email as well. I takes a fair
> > amount of time locating them manually in the pipeline repository, it
> > would be much much easier just with the links to the right logfile...
> > 
> 
> Thanks for the feedback Cyril, we did have links to each failure listed
> before but we were told it made the email look cluttered especially
> if there are multiple failures.

So it's exactly how Dmitry described it, you can't please everyone..,

> The test logs are sorted by arch|host|TC, is there something we can
> do to make it easier to find related logs ?
> https://artifacts.cki-project.org/pipelines/296781/logs/
> 
> Maybe we can look into adding the linked logs to the bottom of the
> email with a reference id next to the failures in the summary, so
> for example:
> 
>      ppc64le:
>       ??? LTP lite [1]
>       ??? xfstests: ext4 [2]

That would work for me.

> We could also look into merging the ltp run logs into a single file
> as well.

That would make it too big I guess. Actually the only part I'm
interested in most of the time is the part of the log with the failing
test. I would be quite happy if we had logs/failures file on the
pipelines sever that would contain only failures extracted from
different logfiles. The question is if that's feasible with your
framework.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
