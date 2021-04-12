Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A46235BA07
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Apr 2021 08:12:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 28AD53C1CDD
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Apr 2021 08:12:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1EC283C1C59;
 Mon, 12 Apr 2021 08:12:33 +0200 (CEST)
Received: from m159.mail.126.com (m159.mail.126.com [220.181.15.9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 7BAE810000EA;
 Mon, 12 Apr 2021 08:12:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=omv0t
 HsVDg5OhRXjTCbQN9/R4KeZyn4ksDaEVqEdPgw=; b=XIRGBheRHcJcuiV6q07Zn
 8b99iRc8yE1xWNXOzZFvp62mUdRYGBQrHS8rKoSlxf6/ompsGL3sVCmvgMqWfTHP
 z2hPnsxQKtsx9i29faerRJ7ML+nTH3keS2JNx30+VmLcIrFsNSFcE7aOLi9vINfm
 9GYN5qLrHLDOh56c02ACpM=
Received: from aoyunsoftware$126.com ( [221.224.30.42] ) by
 ajax-webmail-wmsvr9 (Coremail) ; Mon, 12 Apr 2021 14:12:23 +0800 (CST)
X-Originating-IP: [221.224.30.42]
Date: Mon, 12 Apr 2021 14:12:23 +0800 (CST)
From: aoyunsoftware  <aoyunsoftware@126.com>
To: ltp-request@lists.linux.it, ltp@lists.linux.it
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20210104(ab8c30b6)
 Copyright (c) 2002-2021 www.mailtech.cn 126com
In-Reply-To: <mailman.0.1618206826.17622.ltp@lists.linux.it>
References: <mailman.0.1618206826.17622.ltp@lists.linux.it>
X-CM-CTRLDATA: a+PpzWZvb3Rlcl9odG09MTY3Njo1Ng==
MIME-Version: 1.0
Message-ID: <6c78166c.35e7.178c4b5ace0.Coremail.aoyunsoftware@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: CcqowACHZFHI5HNgAnNFAQ--.57996W
X-CM-SenderInfo: pdr130xvri34xduhqiyswou0bp/1tbiZwxyTl16g1uUcgACsM
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] Welcome to the "ltp" mailing list (Digest mode)
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
Content-Type: multipart/mixed; boundary="===============2107858181=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============2107858181==
Content-Type: multipart/alternative; 
	boundary="----=_Part_49590_1461117812.1618207943904"

------=_Part_49590_1461117812.1618207943904
Content-Type: text/plain; charset=GBK
Content-Transfer-Encoding: base64

CgoKCgoKCgoKCgoKCgoKCgoKCtTaIDIwMjEtMDQtMTIgMTM6NTM6NDajrGx0cC1yZXF1ZXN0QGxp
c3RzLmxpbnV4Lml0INC0tcCjugo+V2VsY29tZSB0byB0aGUgbHRwQGxpc3RzLmxpbnV4Lml0IG1h
aWxpbmcgbGlzdCEKPgo+VG8gcG9zdCB0byB0aGlzIGxpc3QsIHNlbmQgeW91ciBtZXNzYWdlIHRv
Ogo+Cj4gIGx0cEBsaXN0cy5saW51eC5pdAo+Cj5HZW5lcmFsIGluZm9ybWF0aW9uIGFib3V0IHRo
ZSBtYWlsaW5nIGxpc3QgaXMgYXQ6Cj4KPiAgaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5m
by9sdHAKPgo+SWYgeW91IGV2ZXIgd2FudCB0byB1bnN1YnNjcmliZSBvciBjaGFuZ2UgeW91ciBv
cHRpb25zIChlZywgc3dpdGNoIHRvCj5vciBmcm9tIGRpZ2VzdCBtb2RlLCBjaGFuZ2UgeW91ciBw
YXNzd29yZCwgZXRjLiksIHZpc2l0IHlvdXIKPnN1YnNjcmlwdGlvbiBwYWdlIGF0Ogo+Cj4gIGh0
dHBzOi8vbGlzdHMubGludXguaXQvb3B0aW9ucy9sdHAvYW95dW5zb2Z0d2FyZSU0MDEyNi5jb20K
Pgo+WW91IGNhbiBhbHNvIG1ha2Ugc3VjaCBhZGp1c3RtZW50cyB2aWEgZW1haWwgYnkgc2VuZGlu
ZyBhIG1lc3NhZ2UgdG86Cj4KPiAgbHRwLXJlcXVlc3RAbGlzdHMubGludXguaXQKPgo+d2l0aCB0
aGUgd29yZCBgaGVscCcgaW4gdGhlIHN1YmplY3Qgb3IgYm9keSAoZG9uJ3QgaW5jbHVkZSB0aGUK
PnF1b3RlcyksIGFuZCB5b3Ugd2lsbCBnZXQgYmFjayBhIG1lc3NhZ2Ugd2l0aCBpbnN0cnVjdGlv
bnMuCj4KPllvdSBtdXN0IGtub3cgeW91ciBwYXNzd29yZCB0byBjaGFuZ2UgeW91ciBvcHRpb25z
IChpbmNsdWRpbmcgY2hhbmdpbmcKPnRoZSBwYXNzd29yZCwgaXRzZWxmKSBvciB0byB1bnN1YnNj
cmliZSB3aXRob3V0IGNvbmZpcm1hdGlvbi4gIEl0IGlzOgo+Cj4gIDFxYXoyd3N4Cj4KPk5vcm1h
bGx5LCBNYWlsbWFuIHdpbGwgcmVtaW5kIHlvdSBvZiB5b3VyIGxpc3RzLmxpbnV4Lml0IG1haWxp
bmcgbGlzdAo+cGFzc3dvcmRzIG9uY2UgZXZlcnkgbW9udGgsIGFsdGhvdWdoIHlvdSBjYW4gZGlz
YWJsZSB0aGlzIGlmIHlvdQo+cHJlZmVyLiAgVGhpcyByZW1pbmRlciB3aWxsIGFsc28gaW5jbHVk
ZSBpbnN0cnVjdGlvbnMgb24gaG93IHRvCj51bnN1YnNjcmliZSBvciBjaGFuZ2UgeW91ciBhY2Nv
dW50IG9wdGlvbnMuICBUaGVyZSBpcyBhbHNvIGEgYnV0dG9uIG9uCj55b3VyIG9wdGlvbnMgcGFn
ZSB0aGF0IHdpbGwgZW1haWwgeW91ciBjdXJyZW50IHBhc3N3b3JkIHRvIHlvdS4K
------=_Part_49590_1461117812.1618207943904
Content-Type: text/html; charset=GBK
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0ibGluZS1oZWlnaHQ6MS43O2NvbG9yOiMwMDAwMDA7Zm9udC1zaXplOjE0cHg7
Zm9udC1mYW1pbHk6QXJpYWwiPjxwIHN0eWxlPSJtYXJnaW46IDA7Ij48YnI+PC9wPjxwIHN0eWxl
PSJtYXJnaW46IDA7Ij48YnI+PC9wPjxwIHN0eWxlPSJtYXJnaW46IDA7Ij48YnI+PC9wPjxwIHN0
eWxlPSJtYXJnaW46IDA7Ij48YnI+PC9wPjxwIHN0eWxlPSJtYXJnaW46IDA7Ij48YnI+PC9wPjxk
aXYgc3R5bGU9InBvc2l0aW9uOnJlbGF0aXZlO3pvb206MSI+PC9kaXY+PGRpdiBpZD0iZGl2TmV0
ZWFzZU1haWxDYXJkIj48L2Rpdj48cCBzdHlsZT0ibWFyZ2luOiAwOyI+PGJyPjwvcD48cHJlPjxi
cj7U2iAyMDIxLTA0LTEyIDEzOjUzOjQ2o6xsdHAtcmVxdWVzdEBsaXN0cy5saW51eC5pdCDQtLXA
o7oKJmd0O1dlbGNvbWUgdG8gdGhlIGx0cEBsaXN0cy5saW51eC5pdCBtYWlsaW5nIGxpc3QhCiZn
dDsKJmd0O1RvIHBvc3QgdG8gdGhpcyBsaXN0LCBzZW5kIHlvdXIgbWVzc2FnZSB0bzoKJmd0Owom
Z3Q7ICBsdHBAbGlzdHMubGludXguaXQKJmd0OwomZ3Q7R2VuZXJhbCBpbmZvcm1hdGlvbiBhYm91
dCB0aGUgbWFpbGluZyBsaXN0IGlzIGF0OgomZ3Q7CiZndDsgIGh0dHBzOi8vbGlzdHMubGludXgu
aXQvbGlzdGluZm8vbHRwCiZndDsKJmd0O0lmIHlvdSBldmVyIHdhbnQgdG8gdW5zdWJzY3JpYmUg
b3IgY2hhbmdlIHlvdXIgb3B0aW9ucyAoZWcsIHN3aXRjaCB0bwomZ3Q7b3IgZnJvbSBkaWdlc3Qg
bW9kZSwgY2hhbmdlIHlvdXIgcGFzc3dvcmQsIGV0Yy4pLCB2aXNpdCB5b3VyCiZndDtzdWJzY3Jp
cHRpb24gcGFnZSBhdDoKJmd0OwomZ3Q7ICBodHRwczovL2xpc3RzLmxpbnV4Lml0L29wdGlvbnMv
bHRwL2FveXVuc29mdHdhcmUlNDAxMjYuY29tCiZndDsKJmd0O1lvdSBjYW4gYWxzbyBtYWtlIHN1
Y2ggYWRqdXN0bWVudHMgdmlhIGVtYWlsIGJ5IHNlbmRpbmcgYSBtZXNzYWdlIHRvOgomZ3Q7CiZn
dDsgIGx0cC1yZXF1ZXN0QGxpc3RzLmxpbnV4Lml0CiZndDsKJmd0O3dpdGggdGhlIHdvcmQgYGhl
bHAnIGluIHRoZSBzdWJqZWN0IG9yIGJvZHkgKGRvbid0IGluY2x1ZGUgdGhlCiZndDtxdW90ZXMp
LCBhbmQgeW91IHdpbGwgZ2V0IGJhY2sgYSBtZXNzYWdlIHdpdGggaW5zdHJ1Y3Rpb25zLgomZ3Q7
CiZndDtZb3UgbXVzdCBrbm93IHlvdXIgcGFzc3dvcmQgdG8gY2hhbmdlIHlvdXIgb3B0aW9ucyAo
aW5jbHVkaW5nIGNoYW5naW5nCiZndDt0aGUgcGFzc3dvcmQsIGl0c2VsZikgb3IgdG8gdW5zdWJz
Y3JpYmUgd2l0aG91dCBjb25maXJtYXRpb24uICBJdCBpczoKJmd0OwomZ3Q7ICAxcWF6MndzeAom
Z3Q7CiZndDtOb3JtYWxseSwgTWFpbG1hbiB3aWxsIHJlbWluZCB5b3Ugb2YgeW91ciBsaXN0cy5s
aW51eC5pdCBtYWlsaW5nIGxpc3QKJmd0O3Bhc3N3b3JkcyBvbmNlIGV2ZXJ5IG1vbnRoLCBhbHRo
b3VnaCB5b3UgY2FuIGRpc2FibGUgdGhpcyBpZiB5b3UKJmd0O3ByZWZlci4gIFRoaXMgcmVtaW5k
ZXIgd2lsbCBhbHNvIGluY2x1ZGUgaW5zdHJ1Y3Rpb25zIG9uIGhvdyB0bwomZ3Q7dW5zdWJzY3Jp
YmUgb3IgY2hhbmdlIHlvdXIgYWNjb3VudCBvcHRpb25zLiAgVGhlcmUgaXMgYWxzbyBhIGJ1dHRv
biBvbgomZ3Q7eW91ciBvcHRpb25zIHBhZ2UgdGhhdCB3aWxsIGVtYWlsIHlvdXIgY3VycmVudCBw
YXNzd29yZCB0byB5b3UuCjwvcHJlPjwvZGl2Pjxicj48YnI+PHNwYW4gdGl0bGU9Im5ldGVhc2Vm
b290ZXIiPjxwPiZuYnNwOzwvcD48L3NwYW4+
------=_Part_49590_1461117812.1618207943904--


--===============2107858181==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============2107858181==--

