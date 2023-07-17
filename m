Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A68B4756EF4
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Jul 2023 23:34:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BDA683CDDE0
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Jul 2023 23:34:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 169143CA860
 for <ltp@lists.linux.it>; Mon, 17 Jul 2023 23:34:46 +0200 (CEST)
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id F1A9F1400208
 for <ltp@lists.linux.it>; Mon, 17 Jul 2023 23:34:44 +0200 (CEST)
Received: from cwcc.thunk.org (pool-173-48-116-181.bstnma.fios.verizon.net
 [173.48.116.181]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 36HLYOe4023106
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jul 2023 17:34:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
 t=1689629668; bh=AIJ7eQlGnPTeVEA7EYFHb4RQbDLObtg4FWLQb0yKeA0=;
 h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
 b=AhYp6FG0XJz9UMdyC87+MA7F7E0+jqJEAN9UIBRE/YiWHYr7aES6PPKEIOwFeUmyx
 etZXfRnpfgavY+1dnsZmq6ey06zngeSKKYCUXfV3KHc49kBmgHU2zJT5LBD2WD5ZZZ
 AlTszUt4smZI1XFRhjiB8T7q1QepJ83222jdYOJsZk6umyUYQvVDQRtc32b2P3QonV
 IXKs7gUjMpbjdbpdx0y/tnHYMpERKfD0qBl8LBDTNW4wpiofms4HJqy9y2wmu3Z4+C
 ZKJi54xm2h8bE++9tWGmppPwIVElkGSNyHp166KSRlNXytYHG+9h4HIQDCmF/ov2DS
 lGV8oz6wVf/QA==
Received: by cwcc.thunk.org (Postfix, from userid 15806)
 id 809FC15C026A; Mon, 17 Jul 2023 17:34:24 -0400 (EDT)
Date: Mon, 17 Jul 2023 17:34:24 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Ritesh Harjani <ritesh.list@gmail.com>
Message-ID: <20230717213424.GB3842864@mit.edu>
References: <87o7kbnle9.fsf@doe.com>
 <87jzuyobch.fsf@doe.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87jzuyobch.fsf@doe.com>
X-Virus-Scanned: clamav-milter 1.0.1 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
Subject: Re: [LTP] next: kernel BUG at fs/ext4/mballoc.c:4369!
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
Cc: Arnd Bergmann <arnd@arndb.de>, open list <linux-kernel@vger.kernel.org>,
 lkft-triage@lists.linaro.org, linux-mm <linux-mm@kvack.org>,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-ext4 <linux-ext4@vger.kernel.org>, LTP List <ltp@lists.linux.it>,
 Ojaswin Mujoo <ojaswin@linux.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Mon, Jul 17, 2023 at 08:04:54PM +0530, Ritesh Harjani wrote:
> 
> These can basically trigger in extremely low memory space and only when
> such ranges exist in the PA rbtree. Hence, I guess it is a little hard
> to tigger race.

Ritesh, thanks for looking into this!

Naresh, how easy is it for you to trigger the BUG when using LTP?  I
did two xfstests runs using "gce-xfstests -c ext2/default -g auto",
one on the ext4 dev branch, and one on linux-next 20230717, and I
wasn't able to trigger the BUG.

If you can trivially trigger it using LTP (perhaps with a low memory
configuration in your test setup?), that would be useful to know.

Cheers,

					- Ted

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
