Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3CC2FE83E
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Jan 2021 12:01:00 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 44C563C6391
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Jan 2021 12:01:00 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id DB2263C3050
 for <ltp@lists.linux.it>; Thu, 21 Jan 2021 12:00:58 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 04708600800
 for <ltp@lists.linux.it>; Thu, 21 Jan 2021 12:00:57 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1AB38ACF5;
 Thu, 21 Jan 2021 11:00:57 +0000 (UTC)
Date: Thu, 21 Jan 2021 12:00:55 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YAle55yKQz3nvBaR@pevik>
References: <20210121103727.28534-1-pvorel@suse.cz> <YAlabAZEuX6DbSur@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YAlabAZEuX6DbSur@yuki.lan>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/1] configure.ac: More descriptive NUMA error
 message
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
Cc: Donghai Qiao <dqiao@redhat.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> Hi!
> > Some people were confused and searched for libnuma.so.2,
> > which does not exist.

> > Required is libnuma.so.1, but with LIBNUMA_API_VERSION >= 2.
> > The API version is tighten to libnuma version in git, but that has
> > nothing to do with library soname version, which is still 1.0.0.

> > Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
> > Signed-off-by: Petr Vorel <pvorel@suse.cz>

> I consider this safe for the release, please push.
Thanks, merged!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
