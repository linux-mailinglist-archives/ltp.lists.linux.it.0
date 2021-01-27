Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F30F3305B4B
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Jan 2021 13:27:31 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 916DC3C79F7
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Jan 2021 13:27:31 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id B85CF3C0154
 for <ltp@lists.linux.it>; Wed, 27 Jan 2021 13:27:29 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 4DF8460071D
 for <ltp@lists.linux.it>; Wed, 27 Jan 2021 13:27:29 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9CB76ABDA;
 Wed, 27 Jan 2021 12:27:28 +0000 (UTC)
Date: Wed, 27 Jan 2021 13:28:35 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: "liuxp11@chinatelecom.cn" <liuxp11@chinatelecom.cn>
Message-ID: <YBFcc/lc+KkC49Gq@yuki.lan>
References: <20210127115606.28985-1-mdoucha@suse.cz>
 <YBFWrJoS1tVmWGFx@yuki.lan>
 <2021012720143348660139@chinatelecom.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2021012720143348660139@chinatelecom.cn>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Fix tst_pollute_memory() safety margin for huge
 systems
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
Cc: ltp <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> According my test,malloc amount greater than available memory,then invoke the oom-killer.

However that does not mean that allocating MemAvailable or slightly less
than MemAvailable is safe. In fact it's not, at least that I've been
told be kernel developers. I will try to figure out something safe
enough with their help.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
