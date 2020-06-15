Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E081F931B
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Jun 2020 11:18:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 24EAF3C2D56
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Jun 2020 11:18:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id C80BB3C2D20
 for <ltp@lists.linux.it>; Mon, 15 Jun 2020 11:18:38 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id D063A1A014C7
 for <ltp@lists.linux.it>; Mon, 15 Jun 2020 11:18:37 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7DEC3ABE3;
 Mon, 15 Jun 2020 09:18:40 +0000 (UTC)
Date: Mon, 15 Jun 2020 11:18:50 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: kernel test robot <rong.a.chen@intel.com>
Message-ID: <20200615091850.GA3373@yuki.lan>
References: <20200615085836.GR12456@shao2-debian>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200615085836.GR12456@shao2-debian>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] 303cc571d1: ltp.setns01.fail
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
Cc: "Eric W. Biederman" <ebiederm@xmission.com>, Jann Horn <jannh@google.com>,
 LKML <linux-kernel@vger.kernel.org>, lkp@lists.01.org,
 Aleksa Sarai <cyphar@cyphar.com>, Michael Kerrisk <mtk.manpages@gmail.com>,
 Christian Brauner <christian.brauner@ubuntu.com>, ltp@lists.linux.it,
 Serge Hallyn <serge@hallyn.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> setns01     6  TFAIL  :  setns01.c:176: regular file fd exp_errno=22: errno=EBADF(9): Bad file descriptor
> setns01     0  TINFO  :  setns(12, 0x20000)
> setns01     7  TFAIL  :  setns01.c:176: regular file fd exp_errno=22: errno=EBADF(9): Bad file descriptor
> setns01     0  TINFO  :  setns(12, 0x40000000)
> setns01     8  TFAIL  :  setns01.c:176: regular file fd exp_errno=22: errno=EBADF(9): Bad file descriptor
> setns01     0  TINFO  :  setns(12, 0x20000000)
> setns01     9  TFAIL  :  setns01.c:176: regular file fd exp_errno=22: errno=EBADF(9): Bad file descriptor
> setns01     0  TINFO  :  setns(12, 0x4000000)
> setns01    10  TFAIL  :  setns01.c:176: regular file fd exp_errno=22: errno=EBADF(9): Bad file descriptor

The messages here are a bit cryptic, I will fix that later on, but what
it means here is that the errno has changed from EINVAL to EBADF in a
case we pass file descriptor to a regular file to setns().

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
