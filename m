Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2162CA32E
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Dec 2020 13:54:56 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1BEB53C591D
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Dec 2020 13:54:56 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 399B03C4D08
 for <ltp@lists.linux.it>; Tue,  1 Dec 2020 13:54:51 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id C33011A00894
 for <ltp@lists.linux.it>; Tue,  1 Dec 2020 13:54:50 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0B6FFAC55;
 Tue,  1 Dec 2020 12:54:50 +0000 (UTC)
Date: Tue, 1 Dec 2020 13:55:42 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Peter Gubka <pgubka@gmail.com>
Message-ID: <20201201125542.GB27684@yuki.lan>
References: <CAPeFc=TgA6ABrvDthLBoruqfmopx5nhqYYDAv7h0B+CjaFY-CA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPeFc=TgA6ABrvDthLBoruqfmopx5nhqYYDAv7h0B+CjaFY-CA@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] linux kernel versions vs. ltp release tags
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
> I would like to test linux with kernel version 5.4.47.
> Is there any relation between ltp releases and kernel versions?

Short answer: No.

More detailed answer:

LTP should be backwards compatible for about 10 years back for both
kernel and userspace (libc, gcc, etc.). I.e. latest should run fine on
10 years old distribution and anything newer. Latest LTP also contains
more testcases and fixes so in 99% of the cases it makes senes to use
either latest stable release or a git HEAD.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
