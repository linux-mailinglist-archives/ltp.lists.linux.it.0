Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3378A396C1A
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Jun 2021 06:23:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E3A2C3C90C9
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Jun 2021 06:23:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1A4153C90A2
 for <ltp@lists.linux.it>; Tue,  1 Jun 2021 06:23:09 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 3E18D1000CBB
 for <ltp@lists.linux.it>; Tue,  1 Jun 2021 06:23:08 +0200 (CEST)
Received: from [192.168.178.40] (unknown [178.26.168.79])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 339EA9F917;
 Tue,  1 Jun 2021 04:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1622521387; bh=EzYNh0C0PQ2uvP64ArKQK4FBHhQHhE02+RDDHCe6m60=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=UtNDMN784jNknIJ2ZnrHhsAUSLwRVrFkB7l7zoTTBQERqsjAbnMSJxCVH5vVBkWtB
 ZPwABdJufctWNbbtBUNAwXFsCaE5tqOMZcd0eCQFC4Rc3gUE0Mm5dv0buUsH7/VteX
 KLVs6YWZztBEQPXQe8irEy7b7YaeXm+5vIaF3IDg=
To: Cyril Hrubis <chrubis@suse.cz>
References: <20210518122610.17171-1-liwang@redhat.com>
 <20210518122610.17171-2-liwang@redhat.com>
 <d70f9e5f-0008-02aa-e099-2a8243c4b3fa@jv-coder.de> <YLTYDC4hxQPVxkZq@yuki>
 <af8480e6-2020-d21d-bfe7-d9a4d28e0733@jv-coder.de> <YLTcjz4SoLJXPMTg@yuki>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <ef4d1340-ac81-c991-0d18-9515b01e39d5@jv-coder.de>
Date: Tue, 1 Jun 2021 06:23:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <YLTcjz4SoLJXPMTg@yuki>
Content-Language: en-US
X-Spam-Status: No, score=-0.5 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 2/2] tst_test: using SIGTERM to terminate process
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgQ3lyaWwsCgpPbiA1LzMxLzIwMjEgMjo1NCBQTSwgQ3lyaWwgSHJ1YmlzIHdyb3RlOgo+Pj4+
IEJ1dCBvbmUgbW9yZSBzdHJhbmdlIHRoaW5nIGhlcmUuCj4+Pj4gSSB3b25kZXIgd2h5IHRoaXMg
ZXZlbiB3b3Jrcy4gJHBpZCBpcyB1c2VkIGluIF90c3Rfa2lsbF90ZXN0IGFuZCBkZWZpbmVkCj4+
Pj4gaW4gX3RzdF9zZXR1cF90aW1lciBhcyBhIGxvY2FsIHZhcmlhYmxlLgo+Pj4+IEl0IGxvb2tz
IGxpa2UgaXQgaXMgaW5oZXJpdGVkIHRocm91Z2ggdGhlIGNhbGwgY2hhaW4gYW5kIHNpbmNlIGl0
IGlzCj4+Pj4gY29waWVkIHRvIHRoZSBiYWNrZ3JvdW5kIHByb2Nlc3MsIGl0IGNhbm5vdCBiZSBt
YW5pcHVsYXRlZCBieSB0aGUgdGVzdHMuCj4+Pj4gU3RpbGwgSSB3b3VsZCB2b3RlIGZvciBjaGFu
Z2luZyB0aGlzIGF0IHNvbWUgcG9pbnQsIGJlY2F1c2UgaXQgaXMgaGlnaGx5Cj4+Pj4gY29uZnVz
aW5nLgo+Pj4gVGhhdCdzIGFjdHVhbGx5IGEgY29ycmVjdCBhbmQgd2VsbCBkZWZpbmVkIGJlaGF2
aW9yLCBpZiB5b3UgY2FsbCBhCj4+PiBmdW5jdGlvbiBnIGZyb20gZnVuY3Rpb24gZiB0aGUgZnVu
Y3Rpb24gZyBoYXMgYWNjZXNzIHRvIHRoZSB2YXJpYWJsZXMKPj4+IGxvY2FsIHRvIGYuCj4+Pgo+
Pj4gQW5kIHllcyBpdCdzIGNvbmZ1c2luZywgYnV0IHRoZSBhbHRlcm5hdGl2ZSBpcyBoYXZpbmcg
YW5vdGhlciBnbG9iYWwKPj4+IHZhcmlhYmxlIHdoaWNoIEkgZG8gbm90IHRoaW5rIGlzIG11Y2gg
YmV0dGVyIHRoYW4gdGhpcy4KPj4gSG0gc2hlbGwgY29kZSBoYXMgbW9yZSBzdHJhbmdlIGJlaGF2
aW9yIHRoYW4gSSB3b3VsZCBoYXZlIGV2ZXIgZXhwZWN0ZWQuLi4KPiBTdHJvbmdseSBhZ3JlZSBo
ZXJlLCB0byBiZSBob25lc3QgaWYgdGhlcmUgd2FzIGFzIGJldHRlciBzY3JpcHRpbmcKPiBsYW5n
dWFnZSB0aGF0IHdvdWxkIGJlIHdpZGVseSBhdmFpYWJsZSBJIHdvdWxkIGhhdmUgc3dpdGNoZWQg
bG9uZyB0aW1lCj4gYWdvLi4uCj4KPj4gQnV0IGF0IGxlYXN0IExpIGFuZCBteXNlbGYgZGlkIG5v
dCBrbm93IHRoYXQgYW5kIGV2ZW4gd2hpbGUgeW91IGtub3cKPj4gYWJvdXQgdGhpcyAiZmVhdHVy
ZSIsIHlvdSB0aGluayBpdCBpcyBzdHJhbmdlLgo+PiBJIHdvdWxkIHJhdGhlciBsaWtlIHRvIGJl
IGV4cGxpY2l0IGFuZCB1c2UgYSBnbG9iYWwgdmFyaWFibGUgKHdoYXQgaGFybQo+PiBpcyBpdCBy
ZWFsbHk/KSBpbnN0ZWFkIG9mIGNvbmZ1c2luZyB0aGUgbmV4dCBvbmUgbG9va2luZyBhdCB0aGlz
IHBpZWNlCj4+IG9mIGNvZGUuLi4uCj4gSWYgeW91IHJlYWxseSB0aGluayBnbG9iYWwgdmFyaWFi
bGUgd291bGQgYmUgYmV0dGVyLCB0aGVuIGdvIGFoZWFkIGFuZAo+IHNlbmQgYSBwYXRjaCwgSSBk
byBub3QgaGF2ZSBhIHN0cm9uZyBmZWVsaW5ncyBhYm91dCB0aGlzIHBhcnRpY3VsYXIKPiBkZXRh
aWwuCkkgdGhpbmsgdGhlcmUgaXMgYW5vdGhlciBzb2x1dGlvbiwgdG8gbWFrZSB0aGlzIGF0IGxl
YXN0IG1vcmUgZXhwbGljaXQgCndpdGhvdXQgdXNpbmcgYSBuZXcgZ2xvYmFsIHZhcmlhYmxlLgpQ
YXNzaW5nIHRoZSBwaWQgYXMgYSBwYXJhbWV0ZXIgdG8gX3RzdF90aW1lb3V0X3Byb2Nlc3MgYW5k
IF90c3Rfa2lsbF90ZXN0LgpBbHRob3VnaCBpdCBpcyBub3QgcmVxdWlyZWQsIGl0IG1ha2VzIGl0
IGEgbG90IGxlc3MgaW1wbGljaXQgYW5kIGEgbG90IApiZXR0ZXIgc2ltcGxlciB0byByZWFkLgoK
SsO2cmcKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0
aW5mby9sdHAK
