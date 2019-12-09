Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D2C1171EB
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Dec 2019 17:38:57 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CF7383C2354
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Dec 2019 17:38:56 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id A691F3C22D5
 for <ltp@lists.linux.it>; Mon,  9 Dec 2019 17:38:54 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id D23FF60079F
 for <ltp@lists.linux.it>; Mon,  9 Dec 2019 17:38:53 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 17AD5B135
 for <ltp@lists.linux.it>; Mon,  9 Dec 2019 16:38:53 +0000 (UTC)
Date: Mon, 9 Dec 2019 17:38:51 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20191209163851.GA15385@dell5510>
References: <20191121133414.19808-1-chrubis@suse.cz>
 <20191126111953.GA11567@dell5510> <20191209133043.GA7221@rei.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191209133043.GA7221@rei.lan>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/shmat03: Remove CVE tag
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril,

> > > The CVE was proved to be bogus so as far as I can tell we shouldn't list
> > > it in tags.
> > ack (although a link claiming it bogus would be nice).

> I've added added a commit hash of the commit that removed the test from
> runtest/cve to this commit message. It's nicely explained in the
> original commit so there is no need to copy the information over to the
> new commit. Thanks.

Sure. Sorry, I didn't notice bogus explanation was already added in
2588dafd4651706ed7ae34ae3b744b0ee8cd6384.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
