Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DC75137B7C1
	for <lists+linux-ltp@lfdr.de>; Wed, 12 May 2021 10:21:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8C7BC3C644A
	for <lists+linux-ltp@lfdr.de>; Wed, 12 May 2021 10:21:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8E0F73C4D9F
 for <ltp@lists.linux.it>; Wed, 12 May 2021 10:21:16 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id D7B28200055
 for <ltp@lists.linux.it>; Wed, 12 May 2021 10:21:15 +0200 (CEST)
Received: from [192.168.178.40] (unknown [178.26.168.79])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 3E0F59FBCC
 for <ltp@lists.linux.it>; Wed, 12 May 2021 08:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1620807674; bh=cYbM+U2fuIkfBhtzka2sOhhlVdMBVud3bpQBw0DUTwk=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=NHGNiA+rAEgWhtHn0C8vI/SR1wciy3XBVCSxAvMILh5zW9+QYaSrZBEYIH9zxDdxh
 yNISMAsGqHBwna605uewTjGuZYzrh5iDqLDyV6VsRXBBcHcxo3Erwf3zdSA3cmVCF8
 UqYbqYVrbEHfaaQBdi8b3DpMIa8mftExw7sGswnI=
To: ltp@lists.linux.it
References: <20210401141210.9536-1-pvorel@suse.cz> <YJpF5mq0oftICi+u@yuki>
 <YJp7LBc0IxKuwNh2@pevik> <YJuFTZj5h9V02axd@yuki>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <45acf045-d9e6-1143-bb58-e07a1fdad9af@jv-coder.de>
Date: Wed, 12 May 2021 10:22:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YJuFTZj5h9V02axd@yuki>
Content-Language: en-US
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [RFC PATCH v2 1/1] netns_netlink: Rewrite into new API
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

SGksCgpPbiA1LzEyLzIwMjEgOTozNSBBTSwgQ3lyaWwgSHJ1YmlzIHdyb3RlOgo+IEhpIQo+PiBC
VFcgSSBndWVzcyBzb29uZXIgb3IgbGF0ZXIgd2Ugc2hvdWxkIGludHJvZHVjZSB2YXJpYWJsZSB0
byBwcmludCBvbmx5IGluZm8gdGhhdAo+PiBjb25maWcgZmlsZSBpcyBub3QgYXZhaWxhYmxlIChm
b3IgdGhlc2UgZW1iZWRkZWQgcGxhdGZvcm1zIGFuZCBvbGQgYW5kcm9pZCkuCj4gQnV0IHRoYXQg
d291bGQgbWVhbiB0aGF0IHRlc3RzIHdvdWxkIGZhaWwgd2hlbiBzb21ldGhpbmcgaXMgbWlzc2lu
Zy4gSXQKPiBtYWtlcyBtdWNoIG1vcmUgc2Vuc2UgdG8ganVzdCBjb3B5IHRoZSBmaWxlIHNvbWV3
aGVyZSBhbmQgc2V0Cj4gS0NPTkZJR19QQVRIIGV2ZW4gaWYgeW91IGhhdmUgdG8gY3JhZnQgdGhh
dCBmaWxlIGJ5IGhhbmQgaW4gb3JkZXIgdG8KPiBlbmFibGUgdGVzdHMuCisxIGZvciB0aGF0LiBX
ZSBkbyBpdCBvbiBzeXN0ZW0gd2hlcmUgdGhlIGNvbmZpZyBmaWxlIGlzIG5vdCBhbGxvd2VkIHRv
IApiZSBhdmFpbGFibGUsIGJ1dCB3ZSBoYXZlIHRoZSBjb25maWcgb24gdGhlIGhvc3QgcnVubmlu
ZyB0aGUgdGVzdHMuClRoaXMgc2hvdWxkIGJlIHBvc3NpYmxlIGluIG1vc3QgdGVzdGluZyBzY2Vu
YXJpb3MuCgpKw7ZyZwoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4
Lml0L2xpc3RpbmZvL2x0cAo=
