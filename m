Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C430E2CA5CA
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Dec 2020 15:37:00 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5F3E83C5923
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Dec 2020 15:37:00 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id C0A9F3C241A
 for <ltp@lists.linux.it>; Tue,  1 Dec 2020 15:36:56 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 628131000C25
 for <ltp@lists.linux.it>; Tue,  1 Dec 2020 15:36:56 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B61AEAC2D;
 Tue,  1 Dec 2020 14:36:55 +0000 (UTC)
Date: Tue, 1 Dec 2020 15:37:48 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Peter Gubka <pgubka@gmail.com>
Message-ID: <20201201143748.GA3405@yuki.lan>
References: <CAPeFc=TgA6ABrvDthLBoruqfmopx5nhqYYDAv7h0B+CjaFY-CA@mail.gmail.com>
 <20201201125542.GB27684@yuki.lan>
 <CAPeFc=Rvpq90yQKaGfg9gtFhyJNui3CvjY4ewOy6DS2na9RXNQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPeFc=Rvpq90yQKaGfg9gtFhyJNui3CvjY4ewOy6DS2na9RXNQ@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
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
> thanks for the answer. In my particular case there is a test
> https://github.com/linux-test-project/ltp/blob/b59c662104c8989704953d1e5dc8c3c6412daa2a/testcases/kernel/syscalls/sendto/sendto03.c
> which causes kernel panic because it tests something which is not present
> in my kernel.
> Are there any recommendations on what to do in such a case?

Well the test in question is a regression test for a security
vunerability. If the test causes kernel panic that most likely means
that your kernel is vunerable and is missing the patch that that is
mentioned in the top level test commit.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
