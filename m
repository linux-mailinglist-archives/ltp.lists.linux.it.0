Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E28362F76F3
	for <lists+linux-ltp@lfdr.de>; Fri, 15 Jan 2021 11:49:08 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9F4203C6A06
	for <lists+linux-ltp@lfdr.de>; Fri, 15 Jan 2021 11:49:08 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 390163C2644
 for <ltp@lists.linux.it>; Fri, 15 Jan 2021 11:49:07 +0100 (CET)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 9B62C140118C
 for <ltp@lists.linux.it>; Fri, 15 Jan 2021 11:49:06 +0100 (CET)
Received: from [192.168.178.40] (unknown [188.192.1.224])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 1A3B2A1498;
 Fri, 15 Jan 2021 10:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1610707744; bh=SRtKGGD9Hun499SteSFi8hhV7V1XqDRhR+HcHyPIxHw=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=Vq9CUns1D6uaC/8pXhxpGdHkhvUpIlreMOyTFIP2SDASAhi91VWedIQGUnHRMo52d
 InFl1Mi18TSLY1GhchE9g+9oCiTmV3O8TGoOeXOzef3rxneJ9/3H3qKHGUS5EKuqoq
 ZrMUBOGe1KaNCRQcISV0+uKAoOZRofYE/4doquiQ=
To: Xinpeng Liu <liuxp11@chinatelecom.cn>, ltp@lists.linux.it
References: <1610672031-5044-1-git-send-email-liuxp11@chinatelecom.cn>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <b575ead7-dcc2-f4ab-49d2-eac727469187@jv-coder.de>
Date: Fri, 15 Jan 2021 11:49:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <1610672031-5044-1-git-send-email-liuxp11@chinatelecom.cn>
Content-Language: en-US
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] fs/proc01.c:add known issues
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

SGksCgpPbiAxLzE1LzIwMjEgMTo1MyBBTSwgWGlucGVuZyBMaXUgd3JvdGU6Cj4gVGVzdCBpbiB1
YnVudHUyMC4xMCx0aGVyZSBhcmUgc2V2ZXJhbCBmYWlsdXJlIHRlc3RzLgo+Cj4gcHJvYzAxICAg
ICAgMSAgVEZBSUwgIDogIHByb2MwMS5jOjM5NjogcmVhZCBmYWlsZWQ6Cj4gL3Byb2Mvc2VsZi90
YXNrLzYxNTk1L2F0dHIvc21hY2svY3VycmVudDogZXJybm89RUlOVkFMKDIyKTogSW52YWxpZCBh
cmd1bWVudAo+IHByb2MwMSAgICAgIDIgIFRGQUlMICA6ICBwcm9jMDEuYzozOTY6IHJlYWQgZmFp
bGVkOgo+IC9wcm9jL3NlbGYvdGFzay82MTU5NS9hdHRyL2FwcGFybW9yL3ByZXY6IGVycm5vPUVJ
TlZBTCgyMik6IEludmFsaWQgYXJndW1lbnQKPiBwcm9jMDEgICAgICAzICBURkFJTCAgOiAgcHJv
YzAxLmM6Mzk2OiByZWFkIGZhaWxlZDoKPiAvcHJvYy9zZWxmL3Rhc2svNjE1OTUvYXR0ci9hcHBh
cm1vci9leGVjOiBlcnJubz1FSU5WQUwoMjIpOiBJbnZhbGlkIGFyZ3VtZW50Cj4gcHJvYzAxICAg
ICAgNCAgVEZBSUwgIDogIHByb2MwMS5jOjM5NjogcmVhZCBmYWlsZWQ6Cj4gL3Byb2Mvc2VsZi9h
dHRyL3NtYWNrL2N1cnJlbnQ6IGVycm5vPUVJTlZBTCgyMik6IEludmFsaWQgYXJndW1lbnQKPiBw
cm9jMDEgICAgICA1ICBURkFJTCAgOiAgcHJvYzAxLmM6Mzk2OiByZWFkIGZhaWxlZDoKPiAvcHJv
Yy9zZWxmL2F0dHIvYXBwYXJtb3IvcHJldjogZXJybm89RUlOVkFMKDIyKTogSW52YWxpZCBhcmd1
bWVudAo+IHByb2MwMSAgICAgIDYgIFRGQUlMICA6ICBwcm9jMDEuYzozOTY6IHJlYWQgZmFpbGVk
Ogo+IC9wcm9jL3NlbGYvYXR0ci9hcHBhcm1vci9leGVjOiBlcnJubz1FSU5WQUwoMjIpOiBJbnZh
bGlkIGFyZ3VtZW50Cj4KPiBTaWduZWQtb2ZmLWJ5OiBYaW5wZW5nIExpdSA8bGl1eHAxMUBjaGlu
YXRlbGVjb20uY24+CgpSZXZpZXdlZC1ieTogSm9lcmcgVmVobG93IDxqb2VyZy52ZWhsb3dAYW94
LXRlY2guZGU+CgpUZXN0ZWQgb24gdWJ1bnR1IDIwLjA0LgpJIGd1ZXNzIGl0IGlzIG9rIHRvIGNv
bXBsZXRlbHkgZXhjbHVkZSBzbWFjayBhbmQgYXBwYXJtb3IgZm9sZGVycyBmcm9tIAp0aGUgdGVz
dC4gTWF5YmUgdGhlcmUgYXJlIHNvbWUgZmlsZXMgaW4gdGhlcmUsIHRoYXQgY2FuIGJlIHJlYWQg
d2l0aG91dCAKZXJyb3IsIGJ1dCBJIHRoaW5rIHRoYXQgc2hvdWxkIGJlIHVwIHRvIHRlc3RjYXNl
cyBmb3IgdGhlc2UgZmVhdHVyZXMuCgpKw7ZyZwoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRw
czovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
