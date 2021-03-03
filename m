Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E2BF732B68D
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Mar 2021 11:27:08 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B38CB3C56AE
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Mar 2021 11:27:08 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 4C6F13C5687
 for <ltp@lists.linux.it>; Wed,  3 Mar 2021 11:27:07 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id DAB041400991
 for <ltp@lists.linux.it>; Wed,  3 Mar 2021 11:27:06 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 02610AC54;
 Wed,  3 Mar 2021 10:27:06 +0000 (UTC)
Date: Wed, 3 Mar 2021 11:28:39 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: K??ry Maincent <kory.maincent@bootlin.com>
Message-ID: <YD9k15Clrdd/tqtq@yuki.lan>
References: <20210303104833.3d36364e@kmaincent-XPS-13-7390>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210303104833.3d36364e@kmaincent-XPS-13-7390>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] Runtime test CI?
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> I have seen you are using Travis to build CI.
> Have you a runtime CI or a testbench to validate all the LTP tests on several
> distributions and architectures before the release?

Unfortunatelly we do not, it's on my long term TODO though.

I'm slowly getting all the required pieces together, it's mostly done at
this point and I'm using these tools to validate LTP releases.

If you want to experiment have a look at runltp-ng:

https://github.com/metan-ucw/runltp-ng

What I do before the release is to run similar scripts to the
compare_syscalls.sh to generate results in json for different LTP
runtest files on different VMs then diff them with res_diff.pl

What is missing there is a bit of scripts to automate all that so it
could be executed in a loop on a dedicated server and a better output
from res_diff.pl, maybe a html page that would be uploaded somewhere.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
