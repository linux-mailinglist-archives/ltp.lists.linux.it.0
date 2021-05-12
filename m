Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BCE37B38E
	for <lists+linux-ltp@lfdr.de>; Wed, 12 May 2021 03:32:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 43FDE3C8BDA
	for <lists+linux-ltp@lfdr.de>; Wed, 12 May 2021 03:32:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0A4643C585B
 for <ltp@lists.linux.it>; Wed, 12 May 2021 03:32:46 +0200 (CEST)
Received: from regular1.263xmail.com (regular1.263xmail.com [211.150.70.199])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id E307F200758
 for <ltp@lists.linux.it>; Wed, 12 May 2021 03:32:42 +0200 (CEST)
Received: from localhost (unknown [192.168.167.105])
 by regular1.263xmail.com (Postfix) with ESMTP id 3A38C12BC
 for <ltp@lists.linux.it>; Wed, 12 May 2021 09:32:38 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED: 0
X-ANTISPAM-LEVEL: 2
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
Received: from [10.4.23.183] (unknown [58.240.82.166])
 by smtp.263.net (postfix) whith ESMTP id
 P13444T140177903175424S1620783149477848_; 
 Wed, 12 May 2021 09:32:37 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <a91c4bdcd202cd88f3861fba346b893e>
X-RL-SENDER: caojin@uniontech.com
X-SENDER: caojin@uniontech.com
X-LOGIN-NAME: caojin@uniontech.com
X-FST-TO: ltp@lists.linux.it
X-RCPT-COUNT: 2
X-SENDER-IP: 58.240.82.166
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
To: Cyril Hrubis <chrubis@suse.cz>
References: <20210511092926.20509-1-caojin@uniontech.com>
 <YJpskTNEjIYNu2CT@yuki>
From: Cao jin <caojin@uniontech.com>
Message-ID: <a75bc28f-121e-332f-197e-64e3bf15e748@uniontech.com>
Date: Wed, 12 May 2021 09:32:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <YJpskTNEjIYNu2CT@yuki>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] runltp: Miscellaneous cleanups
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 5/11/21 7:37 PM, Cyril Hrubis wrote:
> Hi!
> The changes looks good to me but at the moment we are fairly late in the
> release process so this will have to wait for about two weeks before it
> could be applied.
> 

I am fine with that. Thanks, Cyril.

--
Cao jin




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
