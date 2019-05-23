Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A07E628174
	for <lists+linux-ltp@lfdr.de>; Thu, 23 May 2019 17:42:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4D3833EA785
	for <lists+linux-ltp@lfdr.de>; Thu, 23 May 2019 17:42:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id E32613EA366
 for <ltp@lists.linux.it>; Thu, 23 May 2019 17:42:25 +0200 (CEST)
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com
 [IPv6:2607:f8b0:4864:20::b43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 2B76A14088D4
 for <ltp@lists.linux.it>; Thu, 23 May 2019 17:42:25 +0200 (CEST)
Received: by mail-yb1-xb43.google.com with SMTP id n145so2427845ybg.10
 for <ltp@lists.linux.it>; Thu, 23 May 2019 08:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HG+j7TY4DpRygHM3UrEQnXHNxQFQduonZ8w3weg/d/I=;
 b=EMyZh2QrYPOvgtB7HmtrEzm8xQ/D4BVCda8dVDnbmi613jd9tG2vmdrEOOg1C9IqlY
 oD5nNCJajmfvtexAgGdpl0qK6iuRf1BCly0sUDnHonwU2rKtrwu/Y/atBTnSlfJImw1b
 5lfDl/3YkkWDcSXNa3DeBU2MRQcq5p93rGziMqlMl6OQ4Fx3xy3yWIL5MaQF7Rdh7sG/
 GFDTH5jdCD0AMx1rm8sqNeBsLKokAcgSOja/cpebp2n7VweLnDQm4FGwgjg5CkWMTQ8i
 Ln0mhJYGyn/jrpUunOe92viYUTa4KrfMB1QPIHkypGUNzNfzott6eKYFKy5IfyYjuNR3
 Ox/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HG+j7TY4DpRygHM3UrEQnXHNxQFQduonZ8w3weg/d/I=;
 b=q0FAYg+PBdWq94SHpeNZY7rG+Ajhrd27n9pAOocWxBUHsUIDe6t643CHVJn7bJeE3P
 tNSH9Jth/uYTm3aX2urR6LEYynH+ekRu52hzea/mVPBDrIpxmxQ5yfB0a8GPpNKdBQ2S
 UKbbG2Yd8chCTbwDUUNZjevOjozkegQPRAp422iyCunptT6MIeOKTzC4C3qoa0/Lblso
 eXXwRfTQ8M4nIWvMgmznffhVPZqyoZwSzEzjee6A+hJwlPMn1+79qOhgL5NgCVDgxVhX
 Inv+PoJU5lI6eMVMsHFv1y4NANvlZW+4jaEJQanws6PsejXDOPVh49uLK2Gt5NV9Hasp
 jO3g==
X-Gm-Message-State: APjAAAVLaYoUvS4B4So7OTLgupnqokS1Qv8Z1g/u/yjC87+gTcBTxcY1
 xvaMqbho/U4pIKo3D/Z69TBfju8xNlU87yCzy+M=
X-Google-Smtp-Source: APXvYqzrZwkBCcuERlWxIAk2bsM/tTtR7k8B6E5kHavtuCJDaNJ5XJDBBiL+gCx4BoMgygsKFhQqqHMfvIuU0F0xAg0=
X-Received: by 2002:a25:c983:: with SMTP id z125mr42226333ybf.45.1558626143949; 
 Thu, 23 May 2019 08:42:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190523134549.23103-1-chrubis@suse.cz>
In-Reply-To: <20190523134549.23103-1-chrubis@suse.cz>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 23 May 2019 18:42:12 +0300
Message-ID: <CAOQ4uxhHVG9f1njmPgei8-QO4UEivXbxoHkqKi4f50XN6Gup9A@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Cc: "J. Bruce Fields" <bfields@fieldses.org>,
 overlayfs <linux-unionfs@vger.kernel.org>, ltp@lists.linux.it,
 Miklos Szeredi <miklos@szeredi.hu>
Subject: Re: [LTP] [PATCH] [COMMITTED] syscalls/fcntl33: Fix typo overlapfs
	-> overlayfs
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.18
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gVGh1LCBNYXkgMjMsIDIwMTkgYXQgNDo0NSBQTSBDeXJpbCBIcnViaXMgPGNocnViaXNAc3Vz
ZS5jej4gd3JvdGU6Cj4KPiBTaWduZWQtb2ZmLWJ5OiBDeXJpbCBIcnViaXMgPGNocnViaXNAc3Vz
ZS5jej4KPiAtLS0KPiAgdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9mY250bC9mY250bDMzLmMg
fCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+
Cj4gZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvZmNudGwvZmNudGwzMy5j
IGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9mY250bC9mY250bDMzLmMKPiBpbmRleCA0M2Rj
NWEyYWYuLjYyNzgyM2M1YyAxMDA2NDQKPiAtLS0gYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxz
L2ZjbnRsL2ZjbnRsMzMuYwo+ICsrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvZmNudGwv
ZmNudGwzMy5jCj4gQEAgLTExNyw3ICsxMTcsNyBAQCBzdGF0aWMgdm9pZCBkb190ZXN0KHVuc2ln
bmVkIGludCBpKQo+ICAgICAgICAgaWYgKFRTVF9SRVQgPT0gLTEpIHsKPiAgICAgICAgICAgICAg
ICAgaWYgKHR5cGUgPT0gVFNUX09WRVJMQVlGU19NQUdJQyAmJiBUU1RfRVJSID09IEVBR0FJTikg
ewo+ICAgICAgICAgICAgICAgICAgICAgICAgIHRzdF9yZXMoVElORk8gfCBUVEVSUk5PLAo+IC0g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgImZjbnRsKEZfU0VUTEVBU0UsIEZfV1JMQ0sp
IGZhaWxlZCBvbiBvdmVybGFwZnMgYXMgZXhwZWN0ZWQiKTsKPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICJmY250bChGX1NFVExFQVNFLCBGX1dSTENLKSBmYWlsZWQgb24gb3Zlcmxh
eWZzIGFzIGV4cGVjdGVkIik7CgpZb3UgaGF2ZSAzIG1vcmUgb2YgdGhpcyB0eXBvIGluIGZjbnRs
IHRlc3RzLgoKSWYgeW91IGFzayBtZSwgc2lsZW5jaW5nIHRoaXMgZXJyb3Igc2VlbXMgd3Jvbmcu
CldoaWxlIHRoZSBlcnJvciBpcyAqZXhwZWN0ZWQqIGl0IGlzIHN0aWxsIGEgYnJva2VuIGludGVy
ZmFjZS4KSXQgbWF5IGJlIGp1c3QgYSBtYXR0ZXIgb2YgdGVybWlub2xvZ3ksIGJ1dCBJIGFtIHJl
YWRpbmcgdGhpcyBtZXNzYWdlIGFzOgoKVEVTVCBQQVNTRUQ6IE92ZXJsYXlmcyBmYWlsZWQgYXMg
ZXhwZWN0ZWQKCldoaWxlIGl0IHJlYWxseSBzaG91bGQgYmUgbW9yZSBhbG9uZyB0aGUgbGluZXMg
b2Y6CgpURVNUIFNLSVBQRUQ6IE92ZXJsYXlmcyBkb2Vzbid0IHN1cHBvcnQgd3JpdGUgbGVhc2Vk
CgpCZXNpZGVzLCB0aGlzIHByb2JsZW0gbG9va3MgcXVpdGUgZWFzeSB0byBmaXguCkkgdGhpbmsg
QnJ1Y2Ugd2FzIGFscmVhZHkgbG9va2luZyBhdCBjaGFuZ2luZyB0aGUgaW1wbGVtZW50YXRpb24g
b2YKY2hlY2tfY29uZmxpY3Rpbmdfb3BlbigpLCBzbyBpZiB0aGUgdGVzdCBpcyBub3QgZmFpbGlu
Zywgbm9ib2R5IGlzIGdvaW5nIHRvCm51ZGdlIGZvciBhIGZpeC4uLgoKVGhhbmtzLApBbWlyLgoK
LS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0
cAo=
