Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF411C75B9
	for <lists+linux-ltp@lfdr.de>; Wed,  6 May 2020 18:08:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0BF303C57B6
	for <lists+linux-ltp@lfdr.de>; Wed,  6 May 2020 18:08:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 121313C2624
 for <ltp@lists.linux.it>; Wed,  6 May 2020 18:08:07 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 7A96F14016DB
 for <ltp@lists.linux.it>; Wed,  6 May 2020 18:08:07 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 629B3AD17;
 Wed,  6 May 2020 16:08:09 +0000 (UTC)
Date: Wed, 6 May 2020 18:08:04 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <20200506160804.GB23110@dell5510>
References: <20200429192340.14252-1-pvorel@suse.cz>
 <20200429192340.14252-4-pvorel@suse.cz>
 <c408ffc1-9ba6-ac01-0de9-1726ee72d4a4@oracle.com>
 <20200506150629.GA678@dell5510>
 <43c34d08-439c-a6a0-8e3c-b06ffc61ef40@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <43c34d08-439c-a6a0-8e3c-b06ffc61ef40@oracle.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v6 3/3] route: Increase default loop values
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

Hi Alexey,

> > Or I can use long and LONG_MAX, but IMHO int is OK :)

> >> Can we limit the setup only and iterate (adding and deleting) from
> >> the beginning or use -i option with -c?
> > I'm sorry, I don't understand you. Isn't it INT_MAX enough?


> Yes, it's fine, I just wasn't sure why it was added in the first place,
> 65535, because of some limitation of the ip address setup (you have
> added the separate ip max var though) or something else...

OK, finally merging. Thanks a lot for patient review and many tips!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
