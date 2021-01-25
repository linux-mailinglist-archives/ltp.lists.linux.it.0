Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA5D30256E
	for <lists+linux-ltp@lfdr.de>; Mon, 25 Jan 2021 14:23:45 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9F22B3C53CE
	for <lists+linux-ltp@lfdr.de>; Mon, 25 Jan 2021 14:23:45 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 25F5D3C52AA
 for <ltp@lists.linux.it>; Mon, 25 Jan 2021 14:23:43 +0100 (CET)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 28D48600196
 for <ltp@lists.linux.it>; Mon, 25 Jan 2021 14:23:42 +0100 (CET)
Received: from [192.168.178.40] (unknown [188.192.1.224])
 by mail.jv-coder.de (Postfix) with ESMTPSA id F24FF9F7F6
 for <ltp@lists.linux.it>; Mon, 25 Jan 2021 13:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1611581022; bh=wZ5lsYnrXl/fQ4c7zVs57DoKCvzD+w6MFGHVaq+VoS8=;
 h=Subject:From:To:Message-ID:Date:MIME-Version;
 b=s0QGTSIMKBEulhd1mWtLtMBPYOixl267PF+hcDotyBzhuLe8TEqIOysG78g7n4/zU
 lNm62LQ/MloAycCk7GcKyO/bGHhd5NIW7GNvkQSlkSqvXj+4AydeU0Cgyl8M8fwQ/H
 7xcKdb7MNOGExwZHgNiN5jKRLG/e8pNoqY2QhqZE=
From: Joerg Vehlow <lkml@jv-coder.de>
To: ltp@lists.linux.it
References: <20210125131746.74630-1-lkml@jv-coder.de>
Message-ID: <e573f919-8205-40e2-5187-49bff0983872@jv-coder.de>
Date: Mon, 25 Jan 2021 14:24:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210125131746.74630-1-lkml@jv-coder.de>
Content-Language: en-US
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] memcg/functional: Convert to newlib
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

LS0tIGEvdGVzdGNhc2VzL2tlcm5lbC9jb250cm9sbGVycy9tZW1jZy9mdW5jdGlvbmFsL21lbWNn
X2ZhaWxjbnQuc2gKPiArKysgYi90ZXN0Y2FzZXMva2VybmVsL2NvbnRyb2xsZXJzL21lbWNnL2Z1
bmN0aW9uYWwvbWVtY2dfZmFpbGNudC5zaAo+IEBAIC0xLDU4ICsxLDM5IEBACj4gICAjIS9iaW4v
c2gKPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vci1sYXRlcgo+ICsjIENv
cHlyaWdodCAoYykgMjAwOSBGVUpJVFNVIExJTUlURUQKPiArIyBDb3B5cmlnaHQgKGMpIDIwMTgt
MjAxOSBBUk0gTHRkLiBBbGwgUmlnaHRzIFJlc2VydmVkLgpUaGlzIGlzIGJhZCBjb3B5LWFuZC1w
YXN0ZSBmb3IgYWxsIGZpbGVzLCB3aGVyZSBJIG1lbnRpb25lZCBhcm0sIHNvcnJ5Li4uCgpKw7Zy
ZwoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZv
L2x0cAo=
