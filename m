Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BCAAC1645D4
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Feb 2020 14:40:59 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8C0963C24D4
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Feb 2020 14:40:59 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id B5AA93C2465
 for <ltp@lists.linux.it>; Wed, 19 Feb 2020 14:40:57 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 3E7476012DB
 for <ltp@lists.linux.it>; Wed, 19 Feb 2020 14:40:56 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6004EBDC6;
 Wed, 19 Feb 2020 13:40:56 +0000 (UTC)
Date: Wed, 19 Feb 2020 14:40:55 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Xiao Yang <ice_yangxiao@163.com>
Message-ID: <20200219134055.GA10791@rei>
References: <20200218115918.32203-1-liwang@redhat.com>
 <0774e1e5-c326-e4aa-8c74-45de61d8276b@163.com>
 <CAEemH2c9v87NWM6k_t4d9Vi3wAYYjwfEJp2Cw-zG9pPHvdtV-Q@mail.gmail.com>
 <701290c2-4cd6-154a-d400-7479c57ec910@163.com>
 <d9fbb16b-e3c3-b66f-58ed-99310ff394c8@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d9fbb16b-e3c3-b66f-58ed-99310ff394c8@163.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] cleanup: avoid to generate many redundant obj
 files
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> The root cause is that libswapon.c is built as an object 
> file(libswapon.o) instead of a library file(libswapon.so/libswapon.a).
> 
> Sorry, I just feel strange about the left *.o files.

Given that the library is used in both swapon and swapoff tests we may
as well move it to the toplevel libs/ directory as libltpswap, which
would simplify the Makefiles a bit.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
