Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7293E9EBD
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Aug 2021 08:45:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 061763C6ACC
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Aug 2021 08:45:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 46DE43C29B4
 for <ltp@lists.linux.it>; Thu, 12 Aug 2021 08:45:33 +0200 (CEST)
Received: from smtp-relay-canonical-0.canonical.com
 (smtp-relay-canonical-0.canonical.com [185.125.188.120])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id E824E600219
 for <ltp@lists.linux.it>; Thu, 12 Aug 2021 08:45:32 +0200 (CEST)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 7E02D3F049
 for <ltp@lists.linux.it>; Thu, 12 Aug 2021 06:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1628750725;
 bh=fHys+STg8WsXW2Z/sQ8PQl5oPizp1MJqX77K6JyXlrI=;
 h=To:Cc:References:From:Subject:Message-ID:Date:MIME-Version:
 In-Reply-To:Content-Type;
 b=n1ubA+YQCjKVwrEBjrggnG/nN11Rm1sDyV5XgEJW2gtWWQ28j33PHSm80OHnDrgc8
 J+HGXtNiNgHx3GMTGbbbfsAiq/1aUA6XS6F1rDa/3N3Ro6XwRnqzM83RZQud09+NuG
 rpzGgmn98Lc74hTQ3Z+1D0paa57G8BRgP8qNv1dYILhbjMuTbvV4PbhdadtG5aKKVU
 H74OD6Et/IhSFFKUYGbb2W6s3Y3ShwpjZvTH+70LzV0Rtr2GFw+FJ/1RD8BFGWMNkl
 mAmk/di8N3xc6H2a4FgzN0DHo87TNU5EtPMe33lwu+UPOd+H4RRcNTaln6CgFN/kgM
 rOPfPNUbhbReg==
Received: by mail-ed1-f71.google.com with SMTP id
 b16-20020a0564022790b02903be6352006cso2538864ede.15
 for <ltp@lists.linux.it>; Wed, 11 Aug 2021 23:45:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fHys+STg8WsXW2Z/sQ8PQl5oPizp1MJqX77K6JyXlrI=;
 b=YpG5x1iuRCCmFGfIoz2L83lsFTlPgIifIQg1arj+oF9OX4qRu6RvFI/byKIVtHu7uf
 GPFSvciQ8Bq4I3lyF5eOrNlNmdOkc77YN3hFFKCKV1Sk0qDmhygCTm2bbIqiEREIO6/A
 eEkCl/2UMWJN60l6f2wz/y1iSbY+NRSKE7p8uhCISMDC7vCDEpZbfhe0/EFRo+kEuB9Z
 K4dss32wx84Ynyvl3BzzWjv8GM6WAG8xxlnz/0PQaUtaln0SZy8a7IjN4K/3I59s/38J
 fEBhbYok/mhzTxeAnw9dZhqn2RDUOhI0P+IpciEfq3+vLSIYTr8xuKcHiwrVcJk3WXWS
 POvw==
X-Gm-Message-State: AOAM533b12LAyz0SUYyMTpP354Q4sPrHFDPxK1F7vel2VjUvS6RM9l1V
 zqBHHgCF/ueawUA3iHypdvaOEPk/jFIVT2MRsUIHGaWUXhz7Y4lviwau/0fSdBGQXDrO6dC0aaD
 L44pWc2hl/EGlSlG9pNU8gOT1DKqw
X-Received: by 2002:a17:906:c249:: with SMTP id
 bl9mr2190384ejb.225.1628750724830; 
 Wed, 11 Aug 2021 23:45:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyf2zFKcXBxcwUeDhWRkNPANcrZPqoqgLBzcaGcZOEpn0aW40r1FqNpy2q8gX7ZOhiUF5BMog==
X-Received: by 2002:a17:906:c249:: with SMTP id
 bl9mr2190374ejb.225.1628750724665; 
 Wed, 11 Aug 2021 23:45:24 -0700 (PDT)
Received: from [192.168.8.102] ([86.32.42.198])
 by smtp.gmail.com with ESMTPSA id o23sm670502eds.75.2021.08.11.23.45.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Aug 2021 23:45:24 -0700 (PDT)
To: rpalethorpe@suse.de
References: <20210811101058.36695-1-krzysztof.kozlowski@canonical.com>
 <20210811101058.36695-2-krzysztof.kozlowski@canonical.com>
 <87v94ckpow.fsf@suse.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <90ff7e98-eea9-fe31-15ea-6bb1f12b4eb8@canonical.com>
Date: Thu, 12 Aug 2021 08:45:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <87v94ckpow.fsf@suse.de>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [RESEND PATCH 1/4] controllers/memcg: account per-node
 kernel memory
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gMTEvMDgvMjAyMSAxNjo0MiwgUmljaGFyZCBQYWxldGhvcnBlIHdyb3RlOgo+IEhlbGxvIEty
enlzenRvZiwKPiAKPiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGNh
bm9uaWNhbC5jb20+IHdyaXRlczoKPiAKPj4gUmVjZW50IExpbnV4IGtlcm5lbHMgKCkgY2hhcmdl
IGdyb3VwcyBhbHNvIHdpdGgga2VybmVsIG1lbW9yeS4gIFRoaXMgaXMKPj4gbm90IGxpbWl0ZWQg
b25seSB0byBwcm9jZXNzLWFsbG9jYXRlZCBtZW1vcnkgYnV0IGFsc28gY2dyb3VwLWhhbmRsaW5n
Cj4+IGNvZGUgbWVtb3J5IGFzIHdlbGwuCj4+Cj4+IEZvciBleGFtcGxlIHNpbmNlIGtlcm5lbCB2
NS45IHdpdGggY29tbWl0IDNlMzhlMGFhY2E5ZSAoIm1tOiBtZW1jZzoKPj4gY2hhcmdlIG1lbWNn
IHBlcmNwdSBtZW1vcnkgdG8gdGhlIHBhcmVudCBjZ3JvdXAiKSBjcmVhdGluZyBhIHN1Ymdyb3Vw
Cj4+IGNhdXNlcyBzZXZlcmFsIGtlcm5lbCBhbGxvY2F0aW9ucyB0b3dhcmRzIHRoaXMgZ3JvdXAu
Cj4+Cj4+IFRoZXNlIGFkZGl0aW9uYWwga2VybmVsIG1lbW9yeSBhbGxvY2F0aW9ucyBhcmUgcHJv
cG9ydGlvbmFsIHRvIG51bWJlciBvZgo+PiBDUFVzIGFuZCBudW1iZXIgb2Ygbm9kZXMuCj4+Cj4+
IE9uIGM0Ljh4bGFyZ2UgQVdTIGluc3RhbmNlIHdpdGggMzYgY29yZXMgaW4gdHdvIG5vZGVzIHdp
dGggdjUuMTEgTGludXgKPj4ga2VybmVsIHRoZSBtZW1jZ19zdWJncm91cF9jaGFyZ2UgYW5kIG1l
bWNnX3VzZV9oaWVyYXJjaHlfdGVzdCB0ZXN0cyB3ZXJlCj4+IGZhaWxpbmc6Cj4+Cj4+ICAgICBt
ZW1jZ191c2VfaGllcmFyY2h5X3Rlc3QgMSBUSU5GTzogdGltZW91dCBwZXIgcnVuIGlzIDBoIDVt
IDBzCj4+ICAgICBtZW1jZ191c2VfaGllcmFyY2h5X3Rlc3QgMSBUSU5GTzogc2V0IC9kZXYvbWVt
Y2cvbWVtb3J5LnVzZV9oaWVyYXJjaHkgdG8gMCBmYWlsZWQKPj4gICAgIG1lbWNnX3VzZV9oaWVy
YXJjaHlfdGVzdCAxIFRJTkZPOiB0ZXN0IGlmIG9uZSBvZiB0aGUgYW5jZXN0b3JzIGdvZXMgb3Zl
ciBpdHMgbGltaXQsIHRoZSBwcm9jZXMgd2lsbCBiZSBraWxsZWQKPj4gICAgIG1rZGlyOiBjYW5u
b3QgY3JlYXRlIGRpcmVjdG9yeSDigJhzdWJncm91cOKAmTogQ2Fubm90IGFsbG9jYXRlIG1lbW9y
eQo+PiAgICAgL2hvbWUvdWJ1bnR1L2x0cC1pbnN0YWxsL3Rlc3RjYXNlcy9iaW4vbWVtY2dfdXNl
X2hpZXJhcmNoeV90ZXN0LnNoOiAyNjogY2Q6IGNhbid0IGNkIHRvIHN1Ymdyb3VwCj4+ICAgICBt
ZW1jZ191c2VfaGllcmFyY2h5X3Rlc3QgMSBUSU5GTzogUnVubmluZyBtZW1jZ19wcm9jZXNzIC0t
bW1hcC1sb2NrMSAtcyA4MTkyCj4+ICAgICBtZW1jZ191c2VfaGllcmFyY2h5X3Rlc3QgMSBURkFJ
TDogcHJvY2VzcyAgaXMgbm90IGtpbGxlZAo+PiAgICAgcm1kaXI6IGZhaWxlZCB0byByZW1vdmUg
J3N1Ymdyb3VwJzogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQo+Pgo+PiBUaGUga2VybmVsIHdh
cyB1bmFibGUgdG8gY3JlYXRlIHRoZSBzdWJncm91cCAobWtkaXIgcmV0dXJuZWQgLUVOT01FTSkK
Pj4gZHVlIHRvIHRoaXMgYWRkaXRpb25hbCBwZXItbm9kZSBrZXJuZWwgbWVtb3J5IGFsbG9jYXRp
b25zLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yu
a296bG93c2tpQGNhbm9uaWNhbC5jb20+Cj4+IC0tLQo+PiAgLi4uL2NvbnRyb2xsZXJzL21lbWNn
L2Z1bmN0aW9uYWwvbWVtY2dfbGliLnNoIHwgNDQgKysrKysrKysrKysrKysrKysrKwo+PiAgLi4u
L21lbWNnL2Z1bmN0aW9uYWwvbWVtY2dfc3ViZ3JvdXBfY2hhcmdlLnNoIHwgIDggKy0tLQo+PiAg
Li4uL2Z1bmN0aW9uYWwvbWVtY2dfdXNlX2hpZXJhcmNoeV90ZXN0LnNoICAgIHwgIDggKysrLQo+
PiAgMyBmaWxlcyBjaGFuZ2VkLCA1MiBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQo+Pgo+
PiBkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9jb250cm9sbGVycy9tZW1jZy9mdW5jdGlv
bmFsL21lbWNnX2xpYi5zaCBiL3Rlc3RjYXNlcy9rZXJuZWwvY29udHJvbGxlcnMvbWVtY2cvZnVu
Y3Rpb25hbC9tZW1jZ19saWIuc2gKPj4gaW5kZXggZGFkNjZjNzk4ZTE5Li43MDBlOWUzNjdiZmYg
MTAwNzU1Cj4+IC0tLSBhL3Rlc3RjYXNlcy9rZXJuZWwvY29udHJvbGxlcnMvbWVtY2cvZnVuY3Rp
b25hbC9tZW1jZ19saWIuc2gKPj4gKysrIGIvdGVzdGNhc2VzL2tlcm5lbC9jb250cm9sbGVycy9t
ZW1jZy9mdW5jdGlvbmFsL21lbWNnX2xpYi5zaAo+PiBAQCAtNjMsNiArNjMsNTAgQEAgbWVtY2df
cmVxdWlyZV9oaWVyYXJjaHlfZGlzYWJsZWQoKQo+PiAgCWZpCj4+ICB9Cj4+ICAKPj4gKyMgS2Vy
bmVsIG1lbW9yeSBhbGxvY2F0ZWQgZm9yIHRoZSBwcm9jZXNzIGlzIGFsc28gY2hhcmdlZC4gIEl0
IG1pZ2h0IGRlcGVuZCBvbgo+PiArIyB0aGUgbnVtYmVyIG9mIENQVXMgYW5kIG51bWJlciBvZiBu
b2Rlcy4gRm9yIGV4YW1wbGUgb24ga2VybmVsIHY1LjExCj4+ICsjIGFkZGl0aW9uYWxseSB0b3Rh
bF9jcHVzIChwbHVzIDEgb3IgMikgcGFnZXMgYXJlIGNoYXJnZWQgdG8gdGhlIGdyb3VwIHZpYQo+
PiArIyBrZXJuZWwgbWVtb3J5LiAgRm9yIGEgdHdvLW5vZGUgbWFjaGluZSwgYWRkaXRpb25hbCAx
MDggcGFnZXMga2VybmVsIG1lbW9yeQo+PiArIyBhcmUgY2hhcmdlZCB0byB0aGUgZ3JvdXAuCj4+
ICsjCj4+ICsjIEFkanVzdCB0aGUgbGltaXQgdG8gYWNjb3VudCBzdWNoIHBlci1DUFUgYW5kIHBl
ci1ub2RlIGtlcm5lbCBtZW1vcnkuCj4+ICsjICQxIC0gdmFyaWFibGUgbmFtZSB3aXRoIGxpbWl0
IHRvIGFkanVzdAo+PiArbWVtY2dfYWRqdXN0X2xpbWl0X2Zvcl9rbWVtKCkKPj4gK3sKPj4gKwlb
ICQjIC1uZSAxIF0gJiYgdHN0X2JyayBUQlJPSyAibWVtY2dfYWRqdXN0X2xpbWl0X2Zvcl9rbWVt
IGV4cGVjdHMgMSBwYXJhbWV0ZXIiCj4+ICsJZXZhbCAibG9jYWwgX2xpbWl0PVwkJDEiCj4gCj4g
Q291bGQgd2UgZG8gdGhpcyBhIHNpbXBsZXIgd2F5Pwo+IAo+IEl0IHdvdWxkIGJlIG11Y2ggZWFz
aWVyIHRvIHJlYWQgaWYgd2UganVzdCByZXR1cm5lZCB0aGUgdmFsdWUgd2hpY2gKPiBuZWVkZWQg
dG8gYmUgYWRkZWQuCgpTdXJlLCBJIGNhbiBjaGFuZ2UgaXQuIEp1c3Qgbm90ZSB0aGF0IHRoZSBj
YWxsZXIvdXNlciB3aWxsIHJlcXVpcmUKc2xpZ2h0bHkgbW9yZSBjb2RlLgoKPiAKPj4gKwo+PiAr
CSMgVG90YWwgbnVtYmVyIG9mIENQVXMKPj4gKwlsb2NhbCB0b3RhbF9jcHVzPWB0c3RfbmNwdXNg
Cj4+ICsKPj4gKwkjIEdldCB0aGUgbnVtYmVyIG9mIE5PREVTCj4gCj4gSXMgaXQgYWNjZXB0YWJs
ZSBvciBuZWNlc3NhcnkgdG8gdXNlIC9zeXMvZGV2aWNlcy9zeXN0ZW0vbm9kZS9wb3NzaWJsZQo+
IChvciBvbmxpbmUpIGluc3RlYWQ/CgpNYWtlcyBzZW5zZSwgSSB0b29rIGl0IGZyb20gZXhpc3Rp
bmcgY29kZSBidXQgaXQgbG9va3MgdW5uZWNlc3NhcmlseQpjb21wbGljYXRlZC4KCj4gCj4+ICsJ
aWYgWyAtZiAiL3N5cy9kZXZpY2VzL3N5c3RlbS9ub2RlL2hhc19oaWdoX21lbW9yeSIgXTsgdGhl
bgo+PiArCQlsb2NhbCBtZW1fc3RyaW5nPSJgY2F0IC9zeXMvZGV2aWNlcy9zeXN0ZW0vbm9kZS9o
YXNfaGlnaF9tZW1vcnlgIgo+PiArCWVsc2UKPj4gKwkJbG9jYWwgbWVtX3N0cmluZz0iYGNhdCAv
c3lzL2RldmljZXMvc3lzdGVtL25vZGUvaGFzX25vcm1hbF9tZW1vcnlgIgo+PiArCWZpCj4+ICsK
Pj4gKwlsb2NhbCB0b3RhbF9ub2Rlcz0iYGVjaG8gJG1lbV9zdHJpbmcgfCB0ciAnLCcgJyAnYCIK
Pj4gKwlsb2NhbCBjb3VudD0wCj4+ICsJZm9yIGl0ZW0gaW4gJHRvdGFsX25vZGVzOyBkbwo+PiAr
CQlsb2NhbCBkZWx0YT0xCj4+ICsJCWlmIFsgIiR7aXRlbSMqLSp9IiAhPSAiJGl0ZW0iIF07IHRo
ZW4KPj4gKwkJCWRlbHRhPSQoKCR7aXRlbSMqLSp9IC0gJHtpdGVtJSotKn0gKyAxKSkKPj4gKwkJ
ZmkKPj4gKwkJY291bnQ9JCgoY291bnQgKyAkZGVsdGEpKQo+PiArCWRvbmUKPiAKPiBPciBwZXJo
YXBzIHdlIGNvdWxkIGNvdW50IHRoZSBudW1iZXIgb2YgJ25vZGVbMC05XSsnIGRpcmVjdG9yaWVz
PyBJCj4gdGhpbmsgdGhhdCB3b3VsZCBiZSBlYXNpZXIgdG8gdW5kZXJzdGFuZC4KCkkganVzdCBj
b3BpZWQgdGhlIGV4aXN0aW5nIGNvZGUsIGJ1dCBJIGNhbiB0cnkgdG8gc2ltcGxpZnkgaXQuCgo+
IAo+PiArCXRvdGFsX25vZGVzPSRjb3VudAo+PiArCSMgQWRkaXRpb25hbCBub2RlcyBpbXBvc2Ug
Y2hhcmdpbmcgdGhlIGttZW0sIG5vdCBoYXZpbmcgcmVndWxhciBvbmUgbm9kZQo+PiArCWxvY2Fs
IG5vZGVfbWVtPTAKPj4gKwlpZiBbICR0b3RhbF9ub2RlcyAtZ3QgMSBdOyB0aGVuCj4+ICsJCW5v
ZGVfbWVtPSQoKHRvdGFsX25vZGVzIC0gMSkpCj4+ICsJCW5vZGVfbWVtPSQoKG5vZGVfbWVtICog
UEFHRVNJWkUgKiAxMjgpKQo+PiArCWZpCj4+ICsKPj4gKwlldmFsICIkMT0nJCgoX2xpbWl0ICsg
NCAqIFBBR0VTSVpFICsgdG90YWxfY3B1cyAqIFBBR0VTSVpFICsgbm9kZV9tZW0pKSciCj4+ICsJ
cmV0dXJuIDAKPj4gK30KPiAKPiBPdGhlcndpc2UgbG9va3MgZ29vZC4KClRoYW5rcyBmb3IgcmV2
aWV3IQoKCkJlc3QgcmVnYXJkcywKS3J6eXN6dG9mCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0
dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
