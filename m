Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C72C762C8
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Jul 2019 11:51:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 355603C1D1C
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Jul 2019 11:43:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 4123D3C1C88
 for <ltp@lists.linux.it>; Fri, 26 Jul 2019 11:43:37 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id CD335600F54
 for <ltp@lists.linux.it>; Fri, 26 Jul 2019 11:43:38 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8CB4BAC94;
 Fri, 26 Jul 2019 09:43:35 +0000 (UTC)
Date: Fri, 26 Jul 2019 11:43:38 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Yi Zhao <yi.zhao@windriver.com>
Message-ID: <20190726094338.GA16006@dell5510>
References: <1563785844-28983-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1563785844-28983-1-git-send-email-yi.zhao@windriver.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] *.sh: convert hardcoded python2 to python3
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

Hi Yi,

> We had converted python2 to python3 for all *.py in commit
> 5a8408bc32f0eada5cbf65ac63d5cd2410f95249. But there are still hardcoded
> python2 in some scripts. Convert these python2 to python3.


> -python create_users.py -u 50 -g 50
> +python3 create_users.py -u 50 -g 50
BTW at least some of them could be run directly, i.e.
./create_users.py -u 50 -g 50

BTW do you run this test? As it's not installed (must be run from source tree).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
