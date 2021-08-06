Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 17DC53E22A6
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Aug 2021 06:35:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 94C0A3C7AFA
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Aug 2021 06:35:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CA2AA3C0926
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 06:35:48 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 3E922200987
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 06:35:47 +0200 (CEST)
Received: from [192.168.178.40] (unknown [188.192.255.100])
 by mail.jv-coder.de (Postfix) with ESMTPSA id C58449F69E;
 Fri,  6 Aug 2021 04:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1628224546; bh=aXdhBZlSQzcItqv+GgtHA4OgqvWuCGpFze/JBpwuCc4=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=s/z7At5DK87O4/HP5LTygqfvR0apr+gqhSd3K/rDeOrZJ88kNr8xyYKyZEjvBgkiP
 2YQMq4zGfKZMdkr6xR5IIJs1mIofgWY6zmlqXVnd2CJMvuOjgEDd8Dw0nfZjYaPG0M
 T2JiodM4tnLCrdLkV769itBIP5w3ttICYr5EzUIQ=
To: Bogdan Lezhepekov <bogdan.lezhepekov@suse.com>, ltp@lists.linux.it
References: <20210805140806.3884-1-bogdan.lezhepekov@suse.com>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <eedb05a1-9e21-4047-3669-26f9012d942d@jv-coder.de>
Date: Fri, 6 Aug 2021 06:35:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210805140806.3884-1-bogdan.lezhepekov@suse.com>
Content-Language: en-US
X-Spam-Status: No, score=-0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v1] connectors/cn_pec: improve reliability
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

On 8/5/2021 4:08 PM, Bogdan Lezhepekov via ltp wrote:
> Sometimes pec_listener has not enough time to handle all
> the generated events.
>
> This patch only returns back the delay that was removed
> in a recent patch.
I think I thought about keeping or removing this delay and finally 
decided to remove it for some reason, that I do not remember right now.
Can you tell me the environment where this failed?

Joerg

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
