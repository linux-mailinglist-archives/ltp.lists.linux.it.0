Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 570E323CAB1
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Aug 2020 14:48:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0C0C93C3275
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Aug 2020 14:48:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id B21133C180B
 for <ltp@lists.linux.it>; Tue,  4 Aug 2020 14:16:08 +0200 (CEST)
Received: from sipsolutions.net (s3.sipsolutions.net
 [IPv6:2a01:4f8:191:4433::2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 1924C600B71
 for <ltp@lists.linux.it>; Tue,  4 Aug 2020 14:14:39 +0200 (CEST)
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.93) (envelope-from <johannes@sipsolutions.net>)
 id 1k2vrS-00GE5A-9J
 for ltp@lists.linux.it; Tue, 04 Aug 2020 14:16:06 +0200
Message-ID: <8cf945033b519ac7240e42d29906d0d4ed3ed292.camel@sipsolutions.net>
From: Johannes Berg <johannes@sipsolutions.net>
To: ltp@lists.linux.it
Date: Tue, 04 Aug 2020 14:15:50 +0200
User-Agent: Evolution 3.36.4 (3.36.4-1.fc32) 
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
X-Mailman-Approved-At: Wed, 05 Aug 2020 14:47:31 +0200
Subject: [LTP] looking for a test library home
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

Hi,

After mentioning this on IRC a few days ago, metan suggested I take it
to the list.

Some time ago, I upstreamed "time-travel" and "time-travel=infcpu" modes
for UML (User Mode Linux) which allows time inside to run faster than
real time, and in the =infcpu case completely disconnected from real
time.

Later, I extended this
 1) a combined mode where more than one application can take part in the
    same time simulation; the protocol for this is defined in Linux but
    this mode requires a controller program;
 2) an extension of this to virtio/vhost-user devices.

For 1), the controller program isn't available yet; it's part of my
library/framework. For 2) you need a special vhost-user device-side
implementation due to synchronisation etc., libvhost-user from qemu has
focus on performance and migration and isn't really usable. This is also
part of the framework.

Since we're using this framework to run mostly real firmware code
against real driver code (modified to use virtio instead of pcie) and
also use this framework for unit tests on the device side, there's a
more code in there for making that easy etc.

Consequently, this thing is called the "User Space Firmware
Simulation/Testing Library".

For ... reasons, I can neither put it on my personal github nor on
Intel's, so I'm looking for a good home to have a repository at, and LTP
was suggested as a perhaps fitting location.

What do you think? Ultimately, I think that would simply mean creating
the github.com/linux-test-project/usfstl repository and I could
contribute the code to there in some way, perhaps by sending email
patches, or pull requests, or being maintainer there myself, whichever
you feel is appropriate.

Thanks,
johannes




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
