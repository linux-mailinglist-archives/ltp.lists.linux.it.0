Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 951CE30D43E
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Feb 2021 08:48:14 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 37C9E3C73A3
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Feb 2021 08:48:14 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 1E6F13C2EDF
 for <ltp@lists.linux.it>; Wed,  3 Feb 2021 08:48:11 +0100 (CET)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id ABF5E1A00CD3
 for <ltp@lists.linux.it>; Wed,  3 Feb 2021 08:48:10 +0100 (CET)
Received: from [192.168.178.40] (unknown [188.192.1.224])
 by mail.jv-coder.de (Postfix) with ESMTPSA id C39F09F626
 for <ltp@lists.linux.it>; Wed,  3 Feb 2021 07:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1612338488; bh=H/axJKXmRlIPAVljNR5jQM8w7vlh+oFgbcqAfgogd8o=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=RbDRfMw+i641I5+3Ey9wCN7gwirlutykpFID/sm+N4DLpMp4jbfZcCVjHypaJSZPO
 c0EiLKeTCGUMG5Rj9XM/lnveeaQQlquB0T1Ig06TeqEGlFFyfsSURzOwQrTOci7zi/
 4WhJiXCyqVpcTIbArGi+xko9laxsE5YsQmEJhHGY=
To: ltp@lists.linux.it
References: <20210203074520.18401-1-lkml@jv-coder.de>
 <20210203074520.18401-2-lkml@jv-coder.de>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <54607759-e48f-0a45-fab8-5d07ec32f004@jv-coder.de>
Date: Wed, 3 Feb 2021 08:48:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210203074520.18401-2-lkml@jv-coder.de>
Content-Language: en-US
X-Spam-Status: No, score=-0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 2/2] mq_timedreceive_5-3: Fix test for timestamp
 after INT32_MAX
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SnVzdCBGWUk6CgpPbiAyLzMvMjAyMSA4OjQ1IEFNLCBKb2VyZyBWZWhsb3cgd3JvdGU6Cj4gRnJv
bTogSm9lcmcgVmVobG93IDxqb2VyZy52ZWhsb3dAYW94LXRlY2guZGU+Cj4KPiBUaGUgdGltZW91
dCBmb3IgbXFfdGltZWRyZWNlaXZlIGlzIGFic29sdXRlLiBVc2luZyBJTlQzMl9NQVgKPiBicmVh
a3MgdGhpcyB0ZXN0IGFmdGVyIDIwMzgtMDEtMTkuCkZ1bm55IHRoaW5nIGlzLCB0aGF0IHRoZSBv
dGhlciBidWcgZml4ZWQgaW4gdGhlIGZpcnN0IHBhdGNoIGhpZCB0aGlzIGJ1Zy4KbXFfdGltZWRy
ZWNlaXZlIHJldHVybmVkIHdpdGggRVRJTUVET1VUIGltbWVkaWF0ZWx5LCBidXQgd2FpdCBibG9j
a2VkLAp1bnRpbCBpdCB3YXMgaW50ZXJydXB0ZWQgYnkgdGhlIHNpZ25hbCAtPiBlcm5vIHdhcyBF
SU5UUiBhbmQgdGhlIHRlc3QgCnBhc3NlZC4KCkrDtnJnCgotLSAKTWFpbGluZyBsaXN0IGluZm86
IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
