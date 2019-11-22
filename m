Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3254F1068E7
	for <lists+linux-ltp@lfdr.de>; Fri, 22 Nov 2019 10:35:13 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9BD293C23DF
	for <lists+linux-ltp@lfdr.de>; Fri, 22 Nov 2019 10:35:11 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id B08D13C2241
 for <ltp@lists.linux.it>; Fri, 22 Nov 2019 10:35:06 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id EFF021BBD2FB
 for <ltp@lists.linux.it>; Fri, 22 Nov 2019 10:35:04 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 91391B3D9;
 Fri, 22 Nov 2019 09:35:03 +0000 (UTC)
Date: Fri, 22 Nov 2019 10:35:02 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: automated-testing@yoctoproject.org
Message-ID: <20191122093501.GA19146@rei.lan>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] test metadata update
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
I've had a bit of time to continue working on the test metadata.

I've added a testsuite description to the json file, wrote very simple
javascript based render for the file and added a json schema. It's not
100% finished yet, but it shows some nice progress. For one thing the
file the test parsing produces is not yet fully conformant to the
schema, but I'm getting close. Also the schema is very basic at this
point, we will add more things along the way.

You can see how the test catalog looks at:
http://metan.ucw.cz/outgoing/metadata.html

The rest of the work is at usuall place in my git repo at:
https://github.com/metan-ucw/ltp/tree/master/docparse

Also as per usuall any feedback is welcome.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
