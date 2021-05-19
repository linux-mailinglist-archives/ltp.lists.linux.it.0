Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F06C388C44
	for <lists+linux-ltp@lfdr.de>; Wed, 19 May 2021 13:01:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4B2743C552B
	for <lists+linux-ltp@lfdr.de>; Wed, 19 May 2021 13:01:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CE8903C1A7E
 for <ltp@lists.linux.it>; Wed, 19 May 2021 13:01:54 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id E28CB1A01208
 for <ltp@lists.linux.it>; Wed, 19 May 2021 13:01:53 +0200 (CEST)
Received: from [192.168.178.40] (unknown [178.26.168.79])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 9640C9F75E;
 Wed, 19 May 2021 11:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1621422112; bh=33FIDVB1EE1GAfmsD3vmq0EjTjOJ/qOIRUhgY8HQzBc=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=imo0aLL9aDfi5tz6E8mobAwGQ9X1w4tOaKv+ufonztJEhtEqSCN6ql01xqxBZwG6X
 44Lf8C3tyN0WeIEv8cbYI9GYRRX11BCPg1uIHy25bFzxBxe+Z1pUSWw0eG6d0ig9Ni
 0W1VJMKrXw8NMJ0h2ODZGdg362zrwLhfkdPkMAWQ=
To: Cyril Hrubis <chrubis@suse.cz>
References: <20210519063109.224352-1-lkml@jv-coder.de>
 <20210519063109.224352-2-lkml@jv-coder.de> <YKToUgBnK6ZQ5I0Q@yuki>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <2f8e652b-aaa8-5f98-4f9d-5b7c138c17fa@jv-coder.de>
Date: Wed, 19 May 2021 13:03:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <YKToUgBnK6ZQ5I0Q@yuki>
Content-Language: en-US
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 2/2] shell: Extend timeout tests,
 to run on multiple shells
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, ltp@lists.linux.it
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SEkgQ3lyaWwsCgpPbiA1LzE5LzIwMjEgMTI6MjggUE0sIEN5cmlsIEhydWJpcyB3cm90ZToKPiBI
aSEKPj4gVGhlcmUgYXJlIHNvbWUgZGlmZmVyZW5jZXMgZXNwZWNpYWxseSBpbiBzaWduYWwgaGFu
ZGxpbmcKPj4gYmV0d2VlbiB0aGUgc2hlbGxzLCBzbyBleGVjdXRlIHRoZSB0ZXN0cyBvbiBhcyBt
YW55Cj4+IHNoZWxscyBhcyBwb3NzaWJsZS4KPiBJJ20gbm90IHN1cmUgdGhhdCB3ZSB3YW50IHRv
IHN1cHBvcnQgYW55dGhpbmcgYnV0IGJhc2gsIGRhc2ggYW5kCj4gYnVzeWJveCBhbmQgZXZlbiB0
aGVzZSB0aHJlZSBhcmUgZW5vdWdoIHRyb3VibGUuCj4KPiBPbmUgb2YgbXkgZnJpZW5kcyBvbmNl
IHRvbGQgbWUgdGhhdCBpdCdzIGVhc2llciB0byB3cml0ZSBhIHBvcnRhYmxlCj4gc2hlbGwgdGhh
biBwb3J0YWJsZSBzaGVsbCBjb2RlIGFuZCBpdCBsb29rcyBsaWtlIGhlIHdhcyByaWdodC4uLgo+
CkluIGdlbmVyYWwgSSB3b3VsZCBzYXk6IFlFUwpCdXQgaWYgYXQgc29tZSBwb2ludCBpbiB0aGUg
ZnV0dXJlIHRoZXJlIGFyZSBmZWF0dXJlcyB1c2VkLCB0aGF0IHJlYWxseSAKb25seSB3b3JrIGZv
ciBvbmUgc2hlbGwsCndlIGNhbiBzdGlsbCByZWR1Y2UgdGhlIHRlc3RlZCBzaGVsbHMgZm9yIHRo
aXMgc2NyaXB0LgoKQnR3OiBrc2ggaXMgbm90IHJlYWxseSBzdXBwb3J0LCBpdCBjb21wbGFpbnMg
YWJvdXQgYWxsIGxvY2FsIHZhcmlhYmxlcywKYmVjYXVzZSBpdCBvbmx5IGFsbG93cyB0aGVtIGlu
ICJmdW5jdGlvbiA8bmFtZT4iLXN0eWxlIGZ1bmN0aW9ucy4KQnV0IHRoZSB0aW1lb3V0IGNvZGUg
c3RpbGwgd29ya3MgZXZlbiB0aGVyZS4KCkrDtnJnCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0
dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
