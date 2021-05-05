Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A85A373895
	for <lists+linux-ltp@lfdr.de>; Wed,  5 May 2021 12:33:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3CBF43C577F
	for <lists+linux-ltp@lfdr.de>; Wed,  5 May 2021 12:33:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 645B03C17CE
 for <ltp@lists.linux.it>; Wed,  5 May 2021 12:33:54 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 70FF61401152
 for <ltp@lists.linux.it>; Wed,  5 May 2021 12:33:53 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A3295AC1A
 for <ltp@lists.linux.it>; Wed,  5 May 2021 10:33:52 +0000 (UTC)
To: Petr Vorel <pvorel@suse.cz>
References: <20210505081845.7024-1-mdoucha@suse.cz>
 <20210505081845.7024-6-mdoucha@suse.cz> <YJJtpXWM4BxH2ffu@pevik>
From: Martin Doucha <mdoucha@suse.cz>
Message-ID: <4ea9d02a-2867-1977-cfd3-bd591d211733@suse.cz>
Date: Wed, 5 May 2021 12:33:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <YJJtpXWM4BxH2ffu@pevik>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 6/6] Add test for CVE 2020-25705
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

On 05. 05. 21 12:04, Petr Vorel wrote:
> I wonder if it'd be useful *later* (not bothering with it now) to allow tests
> just declare .needs_netdevice = 1 and have generic network setup done (similarly
> it's done in tst_net.sh). Or just define addresses a prefixes and do library to
> do the setup.

Sounds like a good idea.

> 
>> +	NETDEV_SET_STATE("ltp_veth2", 1);
>> +	NETDEV_ADD_ROUTE_INET("ltp_veth2", 0, 0, htonl(0xfa444e40), 26,
> nit: maybe define 0xfa444e40 (and 0xfa444e00) and 26 as constants?
>> +		0);
>> +
>> +	/* Configure parent namespace */
>> +	NETDEV_CHANGE_NS_FD("ltp_veth1", parentns);
>> +	SAFE_SETNS(parentns, CLONE_NEWNET);
>> +	addr = SRCADDR_BASE; /* 250.68.78.65 */
> nit: maybe repeating the address in the comment is not needed.

Yes, I should fix this and the <time.h> issue. Please push everything up
to patch 5 and then I'll resubmit v4 just for this patch.

> FYI I tested the test on several VM. Very old kernel detects problem only on
> more runs. But given it's 3.16 (and b38e7819cae9 is a fix for 4cdf507d5452 from
> v3.18-rc1 we can ignore this).

Pass is expected here. Vanilla v3.16 AFAIK does not have the global ICMP
rate limiter which introduced the real vulnerability in the first place.

-- 
Martin Doucha   mdoucha@suse.cz
QA Engineer for Software Maintenance
SUSE LINUX, s.r.o.
CORSO IIa
Krizikova 148/34
186 00 Prague 8
Czech Republic

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
