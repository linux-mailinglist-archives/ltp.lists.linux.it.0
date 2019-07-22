Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AAF07003B
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Jul 2019 14:54:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 263013C1D1E
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Jul 2019 14:54:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 3A4243C185E
 for <ltp@lists.linux.it>; Mon, 22 Jul 2019 14:54:27 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 31B63601634
 for <ltp@lists.linux.it>; Mon, 22 Jul 2019 14:54:25 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6405AAC6C;
 Mon, 22 Jul 2019 12:54:25 +0000 (UTC)
Date: Mon, 22 Jul 2019 14:54:24 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Song Jian <songjian15@huawei.com>
Message-ID: <20190722125424.GA17745@rei.lan>
References: <1563762541-89314-1-git-send-email-songjian15@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1563762541-89314-1-git-send-email-songjian15@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH]syscalls/ioctl: bugfix for
 syscalls/ioctl/ioctl_ns05.c syscalls/ioctl/ioctl_ns06.c
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
> fix ioctl_ns05, ioctl_ns06 timeout.
> signal() will return 0 if success, so it have no chance to equal
> nr_wake=1, use another api to to repalce the current api to ensure that
> nr_wark = 0.

I do not understand what is the problem here.

What do you mean by "signal() will return 0 if success" ?

The child has to be suspended in the futex until it's woken up so as far
as I can tell the checkpoint should be able to wake the child a the end
of the run() function.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
