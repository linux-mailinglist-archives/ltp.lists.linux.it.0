Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C447CDBF8
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Oct 2019 08:52:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DE71E3C1CA9
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Oct 2019 08:52:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id C3C733C038C
 for <ltp@lists.linux.it>; Mon,  7 Oct 2019 08:52:15 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 9A91F600152
 for <ltp@lists.linux.it>; Mon,  7 Oct 2019 08:52:15 +0200 (CEST)
Received: from [10.61.40.7] (unknown [37.156.92.209])
 by mail.jv-coder.de (Postfix) with ESMTPSA id CC0AD9F7FC;
 Mon,  7 Oct 2019 06:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1570431133; bh=paOReWcWI0nGDmvEavKjyerqHfbhhMAJ29kU9UUmgKU=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=iWAEwP5IAeUEfrfwOpot9CWdCf0/Qt8IjzDOUVDo+GNTMb4xdSXZy2kq3RGMeTaRo
 6Ukq6hfbDQxkvPpjJrvKDXHLaP2N/HVWMAcMDnd9tHVv5IwxVRKmQzUD4Rx3PyV4O4
 HVYbiuSc0ihWhZh1t/Egyr5j31VhwGeUazW3V7Mw=
To: Cyril Hrubis <chrubis@suse.cz>
References: <20190927092024.97928-1-lkml@jv-coder.de>
 <20191004103414.GE1231@rei>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <c1877802-f006-1c66-ddc3-afdda0b21dea@jv-coder.de>
Date: Mon, 7 Oct 2019 08:52:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191004103414.GE1231@rei>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v2] lsmod01: Add kernel module
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
Cc: "Vehlow, Joerg" <joerg.vehlow@aox-tech.de>, ltp@lists.linux.it
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,
> You are missing the GPL license here, without it the module will taint
> the kernel.

The kernel will still be tainted, even if the license is set, because of 
out-of-tree build.
Do I miss anything?

 > ltp_lsmod01: loading out-of-tree module taints kernel.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
