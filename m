Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3F5FC145
	for <lists+linux-ltp@lfdr.de>; Thu, 14 Nov 2019 09:09:42 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 10FC33C1C94
	for <lists+linux-ltp@lfdr.de>; Thu, 14 Nov 2019 09:09:42 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 8828F3C1414
 for <ltp@lists.linux.it>; Thu, 14 Nov 2019 09:09:40 +0100 (CET)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 3626F141CE6C
 for <ltp@lists.linux.it>; Thu, 14 Nov 2019 09:09:32 +0100 (CET)
Received: from [10.61.40.7] (unknown [37.156.92.209])
 by mail.jv-coder.de (Postfix) with ESMTPSA id D5ACA9F8E6;
 Thu, 14 Nov 2019 08:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1573718972; bh=Gn9bwXOUoRx8HkFVb2He25srDexAU2bPcJ5RetS4UQY=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=DsfsfzGSXpeB+7YtRE8MqOMUp9DQ0T7HtAd388w+clIeAA6m7GMxphxWnu4J2oGLT
 tuwKIRwictAqtHf9xyTQi5xI4wGTrQzI0eD8vcmehgdDaHWicyBeErnLy82945ClZX
 WKKVt3fp/UUi7jBxE7v0gGWfNheSOB6WOCsPrABA=
To: Li Wang <liwang@redhat.com>
References: <20191113104149.42407-1-lkml@jv-coder.de>
 <CAEemH2eP-ibqs=Mc-aMYUxj7CJ-u9CUZnkD8=Ro_2td9StPVZQ@mail.gmail.com>
 <e506bf38-f1d9-6f9e-e4cd-6edf24f74cd9@jv-coder.de>
 <CAEemH2dWkKyx38HFNKDk6Lt1KiDYry9WVDx9Xzg7fVAkp3kOww@mail.gmail.com>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <1c4d8fb5-58e4-5483-26c7-7ab38b5fbd9c@jv-coder.de>
Date: Thu, 14 Nov 2019 09:09:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAEemH2dWkKyx38HFNKDk6Lt1KiDYry9WVDx9Xzg7fVAkp3kOww@mail.gmail.com>
Content-Language: en-US
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] configure.ac: Fix --with* options
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, LTP List <ltp@lists.linux.it>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGksCj4KPiAgICAgRGVmaW5pbmcgQUNfQVJHX1dJVEggd2l0aGluIGFuIGlmIHRvIGV4cHJlc3Mg
ZGVwZW5kZW5jaWVzIGRvZXMgbm90Cj4gICAgIHdvcmsuCj4gICAgIC4vY29uZmlndXJlIC0td2l0
aC1yZWFsdGltZS10ZXN0c3VpdGUgc2V0IHdpdGhfcmVhbHRpbWVfdGVzdHN1aXRlPXllcywKPiAg
ICAgZXZlbiBpZiB3aXRoX2Jhc2g9bm8gb3Igd2l0aF9weXRob249bm8uIFRoZSBjaGVjayBpcyBy
ZW1vdmVkCj4gICAgIGNvbXBsZXRlbHkuCj4KPgo+IE9yLCBtYXliZSB3ZSBjYW4gbWFrZSB1c2Ug
b2YgQVNfSUYgaGVyZT8gYW5kIEkgbm90aWNlZCB0aGVyZSBhcmUgbWFueSAKPiBwbGFjZXMgdGhh
dCB1c2UgImlmIHRlc3QgLi4uIiBpbiB0aGUgY29uZmlndXJlLmFjIAo+IDxodHRwOi8vY29uZmln
dXJlLmFjPiBmaWxlLiBUaGF0IGxvb2tzwqB0YW5nbHkuLi4KSSBsZWZ0IGEgVE9ETyBpbiB0aGVy
ZSBzbyBpdCBjYW4gYmUgZml4ZWQgbGF0ZXIsIG1heWJlIHRvZ2V0aGVyIHdpdGggCm90aGVyIGVy
cm9ycy4gSSB0aGluayB0aGlzIGRvZXMgbm90IGJsb2NrIG1lcmdpbmcgdGhpcyBwYXRjaCBmaXJz
dD8KVGhlIHB5dGhvbiByZXF1aXJlbWVudCBmb3IgcmVhbHRpbWUtdGVzdHN1aXRlIGlzIG91dGRh
dGVkL3dyb25nIGFueXdheSwgCmlmIEkgcmVtZW1iZXIgY29ycmVjdGx5LiBBIGNvbGxlYWd1ZSBv
ZiBtaW5lIHJlY2VudGx5CmludmVzdGlnYXRlZCB0aGUgcHl0aG9uIHJlcXVpcmVtZW50IGFuZCB3
ZSBjYW1lIHRvIHRoZSBjb25jbHVzaW9uLCB0aGF0IAppdCBpcyBub3QgbmVlZGVkIGZvciBydW5u
aW5nIHRoZSB0ZXN0LgpJIHRoaW5rIGl0IHdhcyB1c2VkIG9ubHkgZm9yIG1hbnVhbCB0ZXN0IHJl
c3VsdCBldmFsdWF0aW9uLgoKU28gdGhlcmUgc2VlbXMgdG8gYmUgbW9yZSB3b3JrIHJlZ2FyZGlu
ZyBkZXBlbmRlbmNpZXMgYmV0d2VlbiBjb25maWd1cmUgCm9wdGlvbnMuCgpKw7ZyZwoKLS0gCk1h
aWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
