Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA9C2070D9
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Jun 2020 12:09:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AA3DA3C2B9F
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Jun 2020 12:09:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 513163C05A0
 for <ltp@lists.linux.it>; Wed, 24 Jun 2020 12:09:44 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id ACCE26000E8
 for <ltp@lists.linux.it>; Wed, 24 Jun 2020 12:09:43 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 94B0DADC8;
 Wed, 24 Jun 2020 10:09:42 +0000 (UTC)
Date: Wed, 24 Jun 2020 12:10:02 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Cixi Geng <gengcixi@gmail.com>
Message-ID: <20200624101002.GB30917@yuki.lan>
References: <20200623112827.10744-1-chrubis@suse.cz>
 <20200623112827.10744-2-chrubis@suse.cz>
 <574e52f4-8988-a562-57c5-274a86e6e8cb@xilinx.com>
 <20200624090523.GA29350@yuki.lan>
 <adafab63-4390-a4a3-b3aa-923b31d5ac37@xilinx.com>
 <20200624092940.GA30917@yuki.lan>
 <CAF12kFvBj+9AF5AoJK=Varb0ZVGCNqW++8cS=j4BQRGxdQY=gw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF12kFvBj+9AF5AoJK=Varb0ZVGCNqW++8cS=j4BQRGxdQY=gw@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [Automated-testing] [PATCH 1/2] tst_test: Add support for
 device discovery
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
Cc: Michal Simek <michal.simek@xilinx.com>, Carlos Hernandez <ceh@ti.com>,
 automated-testing@yoctoproject.org, Orson Zhai <orsonzhai@gmail.com>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> in the ltp-ddt test script ,it  can auto detect which serial devices are on
> the machine, and filter out the serial ports in used???So I am more
> concerned about whether it can have this function in  the device-discovery.sh

That's the piece that is lab specific and used in your lab, there will
be no offical script and you are supposed to maintain it yourself.

The approach here is to isolate all the lab specific details into a
single place since that code does not belong to the LTP upstream
codebase.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
