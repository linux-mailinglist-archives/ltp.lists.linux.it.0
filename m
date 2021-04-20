Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B505D365A9A
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Apr 2021 15:55:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7101D3C8EA7
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Apr 2021 15:55:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 777A73C2403
 for <ltp@lists.linux.it>; Tue, 20 Apr 2021 15:55:07 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id E812F10000E1
 for <ltp@lists.linux.it>; Tue, 20 Apr 2021 15:55:06 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 43B30AF9E
 for <ltp@lists.linux.it>; Tue, 20 Apr 2021 13:55:06 +0000 (UTC)
Date: Tue, 20 Apr 2021 15:41:06 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Message-ID: <YH7Z8nOX90qjsMpa@yuki>
MIME-Version: 1.0
Content-Disposition: inline
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] runltp-ng and possible ltp-pan deprecation
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
As you may have know some time ago I have started to work on runltp-ng a
script to replace runltp and ltp-pan.

The new executor is different in several key aspects, for example:

- it can and is supposed to run on a different machine from the system
  under test (although it still supports running on the same machine)

- there are different backends, it can run tests locally, over ssh, or
  start a VM with qemu

- produces different output formats currently html or json

We have been using runltp-ng in SUSE for a while and it works for us
quite well and I think that we need a larger user base now to iron out
all the quirks. So unless someone strongly disagrees I think that it's
time to make it officialy supported test executor for LTP.

I would like to eventually get rid of runltp and ltp-pan, but if that
happens it should be done once everyone switched over to a different
solution and it's probably still at least a year or two from now.

To remind you the code still lives in my private repository at:

https://github.com/metan-ucw/runltp-ng

For a start I would like to move the code somewhere to the
linux-test-project github just to make it more visible. Does everyone
agree to that?

Also there are two different options how to do that. Either we put it
into runltp-ng directory to the LTP git root or we may as well create a
separate repository under the linux-test-project and make it a ltp git
submodule. Any preferencies to that?

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
