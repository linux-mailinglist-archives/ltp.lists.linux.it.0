Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D0792198D39
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Mar 2020 09:42:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 30B5D3C30DC
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Mar 2020 09:42:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id C30093C30AD
 for <ltp@lists.linux.it>; Tue, 31 Mar 2020 09:41:56 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 917D2600101
 for <ltp@lists.linux.it>; Tue, 31 Mar 2020 09:41:56 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BEB37B080;
 Tue, 31 Mar 2020 07:41:55 +0000 (UTC)
Date: Tue, 31 Mar 2020 09:41:54 +0200
From: Petr Vorel <pvorel@suse.cz>
To: gengcixi@gmail.com
Message-ID: <20200331074154.GA23091@dell5510>
References: <20200331065442.28591-1-gengcixi@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200331065442.28591-1-gengcixi@gmail.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V3] uart: add uart testcase in kernel
 device-drivers
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
Cc: Orson Zhai <orsonzhai@gmail.com>, Carlos Hernandez <ceh@ti.com>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cixi,

thanks for your patch and effort. While we appreciate it, I have to admit that
Cyril's version is IMHO much cleaner and more adjusted to LTP style.

So I'd vote for him to add the loopback and merge his version.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
