Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 221061CC958
	for <lists+linux-ltp@lfdr.de>; Sun, 10 May 2020 10:22:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 074413C563E
	for <lists+linux-ltp@lfdr.de>; Sun, 10 May 2020 10:22:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 6DA013C180B
 for <ltp@lists.linux.it>; Sun, 10 May 2020 10:21:55 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id AC5A76006CF
 for <ltp@lists.linux.it>; Sun, 10 May 2020 10:21:38 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 82EFBAC69;
 Sun, 10 May 2020 08:21:56 +0000 (UTC)
Date: Sun, 10 May 2020 10:21:51 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20200510082151.GA13961@x230>
References: <797dd5eeadd81fae30635dd66d0a715cc213c51e.1588942651.git.jstancek@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <797dd5eeadd81fae30635dd66d0a715cc213c51e.1588942651.git.jstancek@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] nm01: fix regex matching internal symbols
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

> Current regex matches any word character followed by space
> and one of letters "abdft". So it doesn't match only symbol type,
> but can match for example value and size:
>   $ grep "\w [a,b,d,f,t]" nm.out
>   __libc_csu_init T 10000640 b4
>                    matches ^ ^

> Signed-off-by: Jan Stancek <jstancek@redhat.com>
Reviewed-by: Petr Vorel <pvorel@suse.cz>
Good catch, Jan.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
