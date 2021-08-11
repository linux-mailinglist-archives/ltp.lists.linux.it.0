Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0393E93CF
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Aug 2021 16:43:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 44E6C3C7020
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Aug 2021 16:43:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E51253C0F90
 for <ltp@lists.linux.it>; Wed, 11 Aug 2021 16:43:00 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id A18321000541
 for <ltp@lists.linux.it>; Wed, 11 Aug 2021 16:42:59 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 068682214D;
 Wed, 11 Aug 2021 14:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1628692979;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L19tNq0X0WJpq0eoLfnXmDyrQcq8U6fcAIZIR6lZJ1E=;
 b=rr1h92SaJs5LOWQUMbqkXtSpUIhCCAqSrSSu8StxST6YvXBC1GYQp9nnYMH6BVmBzN2IF4
 iwk5UZ5vRFszjIUJgfNrgjwCzfWSoXMxbIu4pJHduJJ191El+6J6NVUqyhkkrqdlofZ1Bp
 rnb1/p/etCdKuvsVLp095Ld+AuYT+Sw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1628692979;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L19tNq0X0WJpq0eoLfnXmDyrQcq8U6fcAIZIR6lZJ1E=;
 b=4pQH4NIVwhdbL+lAbN1CvuOIBuexrQ/L3/OTGCKFeOhXAtXrTjt0/fDYazmmnYiFcnXSS3
 L44XFtkMDcPS0bDA==
Received: from g78 (rpalethorpe.tcp.ovpn1.nue.suse.de [10.163.17.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id A9AE2A3CC9;
 Wed, 11 Aug 2021 14:42:58 +0000 (UTC)
References: <20210811101058.36695-1-krzysztof.kozlowski@canonical.com>
 <20210811101058.36695-2-krzysztof.kozlowski@canonical.com>
User-agent: mu4e 1.4.15; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-reply-to: <20210811101058.36695-2-krzysztof.kozlowski@canonical.com>
Date: Wed, 11 Aug 2021 15:42:55 +0100
Message-ID: <87v94ckpow.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
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
Reply-To: rpalethorpe@suse.de
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGVsbG8gS3J6eXN6dG9mLAoKS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3Nr
aUBjYW5vbmljYWwuY29tPiB3cml0ZXM6Cgo+IFJlY2VudCBMaW51eCBrZXJuZWxzICgpIGNoYXJn
ZSBncm91cHMgYWxzbyB3aXRoIGtlcm5lbCBtZW1vcnkuICBUaGlzIGlzCj4gbm90IGxpbWl0ZWQg
b25seSB0byBwcm9jZXNzLWFsbG9jYXRlZCBtZW1vcnkgYnV0IGFsc28gY2dyb3VwLWhhbmRsaW5n
Cj4gY29kZSBtZW1vcnkgYXMgd2VsbC4KPgo+IEZvciBleGFtcGxlIHNpbmNlIGtlcm5lbCB2NS45
IHdpdGggY29tbWl0IDNlMzhlMGFhY2E5ZSAoIm1tOiBtZW1jZzoKPiBjaGFyZ2UgbWVtY2cgcGVy
Y3B1IG1lbW9yeSB0byB0aGUgcGFyZW50IGNncm91cCIpIGNyZWF0aW5nIGEgc3ViZ3JvdXAKPiBj
YXVzZXMgc2V2ZXJhbCBrZXJuZWwgYWxsb2NhdGlvbnMgdG93YXJkcyB0aGlzIGdyb3VwLgo+Cj4g
VGhlc2UgYWRkaXRpb25hbCBrZXJuZWwgbWVtb3J5IGFsbG9jYXRpb25zIGFyZSBwcm9wb3J0aW9u
YWwgdG8gbnVtYmVyIG9mCj4gQ1BVcyBhbmQgbnVtYmVyIG9mIG5vZGVzLgo+Cj4gT24gYzQuOHhs
YXJnZSBBV1MgaW5zdGFuY2Ugd2l0aCAzNiBjb3JlcyBpbiB0d28gbm9kZXMgd2l0aCB2NS4xMSBM
aW51eAo+IGtlcm5lbCB0aGUgbWVtY2dfc3ViZ3JvdXBfY2hhcmdlIGFuZCBtZW1jZ191c2VfaGll
cmFyY2h5X3Rlc3QgdGVzdHMgd2VyZQo+IGZhaWxpbmc6Cj4KPiAgICAgbWVtY2dfdXNlX2hpZXJh
cmNoeV90ZXN0IDEgVElORk86IHRpbWVvdXQgcGVyIHJ1biBpcyAwaCA1bSAwcwo+ICAgICBtZW1j
Z191c2VfaGllcmFyY2h5X3Rlc3QgMSBUSU5GTzogc2V0IC9kZXYvbWVtY2cvbWVtb3J5LnVzZV9o
aWVyYXJjaHkgdG8gMCBmYWlsZWQKPiAgICAgbWVtY2dfdXNlX2hpZXJhcmNoeV90ZXN0IDEgVElO
Rk86IHRlc3QgaWYgb25lIG9mIHRoZSBhbmNlc3RvcnMgZ29lcyBvdmVyIGl0cyBsaW1pdCwgdGhl
IHByb2NlcyB3aWxsIGJlIGtpbGxlZAo+ICAgICBta2RpcjogY2Fubm90IGNyZWF0ZSBkaXJlY3Rv
cnkg4oCYc3ViZ3JvdXDigJk6IENhbm5vdCBhbGxvY2F0ZSBtZW1vcnkKPiAgICAgL2hvbWUvdWJ1
bnR1L2x0cC1pbnN0YWxsL3Rlc3RjYXNlcy9iaW4vbWVtY2dfdXNlX2hpZXJhcmNoeV90ZXN0LnNo
OiAyNjogY2Q6IGNhbid0IGNkIHRvIHN1Ymdyb3VwCj4gICAgIG1lbWNnX3VzZV9oaWVyYXJjaHlf
dGVzdCAxIFRJTkZPOiBSdW5uaW5nIG1lbWNnX3Byb2Nlc3MgLS1tbWFwLWxvY2sxIC1zIDgxOTIK
PiAgICAgbWVtY2dfdXNlX2hpZXJhcmNoeV90ZXN0IDEgVEZBSUw6IHByb2Nlc3MgIGlzIG5vdCBr
aWxsZWQKPiAgICAgcm1kaXI6IGZhaWxlZCB0byByZW1vdmUgJ3N1Ymdyb3VwJzogTm8gc3VjaCBm
aWxlIG9yIGRpcmVjdG9yeQo+Cj4gVGhlIGtlcm5lbCB3YXMgdW5hYmxlIHRvIGNyZWF0ZSB0aGUg
c3ViZ3JvdXAgKG1rZGlyIHJldHVybmVkIC1FTk9NRU0pCj4gZHVlIHRvIHRoaXMgYWRkaXRpb25h
bCBwZXItbm9kZSBrZXJuZWwgbWVtb3J5IGFsbG9jYXRpb25zLgo+Cj4gU2lnbmVkLW9mZi1ieTog
S3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBjYW5vbmljYWwuY29tPgo+
IC0tLQo+ICAuLi4vY29udHJvbGxlcnMvbWVtY2cvZnVuY3Rpb25hbC9tZW1jZ19saWIuc2ggfCA0
NCArKysrKysrKysrKysrKysrKysrCj4gIC4uLi9tZW1jZy9mdW5jdGlvbmFsL21lbWNnX3N1Ymdy
b3VwX2NoYXJnZS5zaCB8ICA4ICstLS0KPiAgLi4uL2Z1bmN0aW9uYWwvbWVtY2dfdXNlX2hpZXJh
cmNoeV90ZXN0LnNoICAgIHwgIDggKysrLQo+ICAzIGZpbGVzIGNoYW5nZWQsIDUyIGluc2VydGlv
bnMoKyksIDggZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9j
b250cm9sbGVycy9tZW1jZy9mdW5jdGlvbmFsL21lbWNnX2xpYi5zaCBiL3Rlc3RjYXNlcy9rZXJu
ZWwvY29udHJvbGxlcnMvbWVtY2cvZnVuY3Rpb25hbC9tZW1jZ19saWIuc2gKPiBpbmRleCBkYWQ2
NmM3OThlMTkuLjcwMGU5ZTM2N2JmZiAxMDA3NTUKPiAtLS0gYS90ZXN0Y2FzZXMva2VybmVsL2Nv
bnRyb2xsZXJzL21lbWNnL2Z1bmN0aW9uYWwvbWVtY2dfbGliLnNoCj4gKysrIGIvdGVzdGNhc2Vz
L2tlcm5lbC9jb250cm9sbGVycy9tZW1jZy9mdW5jdGlvbmFsL21lbWNnX2xpYi5zaAo+IEBAIC02
Myw2ICs2Myw1MCBAQCBtZW1jZ19yZXF1aXJlX2hpZXJhcmNoeV9kaXNhYmxlZCgpCj4gIAlmaQo+
ICB9Cj4gIAo+ICsjIEtlcm5lbCBtZW1vcnkgYWxsb2NhdGVkIGZvciB0aGUgcHJvY2VzcyBpcyBh
bHNvIGNoYXJnZWQuICBJdCBtaWdodCBkZXBlbmQgb24KPiArIyB0aGUgbnVtYmVyIG9mIENQVXMg
YW5kIG51bWJlciBvZiBub2Rlcy4gRm9yIGV4YW1wbGUgb24ga2VybmVsIHY1LjExCj4gKyMgYWRk
aXRpb25hbGx5IHRvdGFsX2NwdXMgKHBsdXMgMSBvciAyKSBwYWdlcyBhcmUgY2hhcmdlZCB0byB0
aGUgZ3JvdXAgdmlhCj4gKyMga2VybmVsIG1lbW9yeS4gIEZvciBhIHR3by1ub2RlIG1hY2hpbmUs
IGFkZGl0aW9uYWwgMTA4IHBhZ2VzIGtlcm5lbCBtZW1vcnkKPiArIyBhcmUgY2hhcmdlZCB0byB0
aGUgZ3JvdXAuCj4gKyMKPiArIyBBZGp1c3QgdGhlIGxpbWl0IHRvIGFjY291bnQgc3VjaCBwZXIt
Q1BVIGFuZCBwZXItbm9kZSBrZXJuZWwgbWVtb3J5Lgo+ICsjICQxIC0gdmFyaWFibGUgbmFtZSB3
aXRoIGxpbWl0IHRvIGFkanVzdAo+ICttZW1jZ19hZGp1c3RfbGltaXRfZm9yX2ttZW0oKQo+ICt7
Cj4gKwlbICQjIC1uZSAxIF0gJiYgdHN0X2JyayBUQlJPSyAibWVtY2dfYWRqdXN0X2xpbWl0X2Zv
cl9rbWVtIGV4cGVjdHMgMSBwYXJhbWV0ZXIiCj4gKwlldmFsICJsb2NhbCBfbGltaXQ9XCQkMSIK
CkNvdWxkIHdlIGRvIHRoaXMgYSBzaW1wbGVyIHdheT8KCkl0IHdvdWxkIGJlIG11Y2ggZWFzaWVy
IHRvIHJlYWQgaWYgd2UganVzdCByZXR1cm5lZCB0aGUgdmFsdWUgd2hpY2gKbmVlZGVkIHRvIGJl
IGFkZGVkLgoKPiArCj4gKwkjIFRvdGFsIG51bWJlciBvZiBDUFVzCj4gKwlsb2NhbCB0b3RhbF9j
cHVzPWB0c3RfbmNwdXNgCj4gKwo+ICsJIyBHZXQgdGhlIG51bWJlciBvZiBOT0RFUwoKSXMgaXQg
YWNjZXB0YWJsZSBvciBuZWNlc3NhcnkgdG8gdXNlIC9zeXMvZGV2aWNlcy9zeXN0ZW0vbm9kZS9w
b3NzaWJsZQoob3Igb25saW5lKSBpbnN0ZWFkPwoKPiArCWlmIFsgLWYgIi9zeXMvZGV2aWNlcy9z
eXN0ZW0vbm9kZS9oYXNfaGlnaF9tZW1vcnkiIF07IHRoZW4KPiArCQlsb2NhbCBtZW1fc3RyaW5n
PSJgY2F0IC9zeXMvZGV2aWNlcy9zeXN0ZW0vbm9kZS9oYXNfaGlnaF9tZW1vcnlgIgo+ICsJZWxz
ZQo+ICsJCWxvY2FsIG1lbV9zdHJpbmc9ImBjYXQgL3N5cy9kZXZpY2VzL3N5c3RlbS9ub2RlL2hh
c19ub3JtYWxfbWVtb3J5YCIKPiArCWZpCj4gKwo+ICsJbG9jYWwgdG90YWxfbm9kZXM9ImBlY2hv
ICRtZW1fc3RyaW5nIHwgdHIgJywnICcgJ2AiCj4gKwlsb2NhbCBjb3VudD0wCj4gKwlmb3IgaXRl
bSBpbiAkdG90YWxfbm9kZXM7IGRvCj4gKwkJbG9jYWwgZGVsdGE9MQo+ICsJCWlmIFsgIiR7aXRl
bSMqLSp9IiAhPSAiJGl0ZW0iIF07IHRoZW4KPiArCQkJZGVsdGE9JCgoJHtpdGVtIyotKn0gLSAk
e2l0ZW0lKi0qfSArIDEpKQo+ICsJCWZpCj4gKwkJY291bnQ9JCgoY291bnQgKyAkZGVsdGEpKQo+
ICsJZG9uZQoKT3IgcGVyaGFwcyB3ZSBjb3VsZCBjb3VudCB0aGUgbnVtYmVyIG9mICdub2RlWzAt
OV0rJyBkaXJlY3Rvcmllcz8gSQp0aGluayB0aGF0IHdvdWxkIGJlIGVhc2llciB0byB1bmRlcnN0
YW5kLgoKPiArCXRvdGFsX25vZGVzPSRjb3VudAo+ICsJIyBBZGRpdGlvbmFsIG5vZGVzIGltcG9z
ZSBjaGFyZ2luZyB0aGUga21lbSwgbm90IGhhdmluZyByZWd1bGFyIG9uZSBub2RlCj4gKwlsb2Nh
bCBub2RlX21lbT0wCj4gKwlpZiBbICR0b3RhbF9ub2RlcyAtZ3QgMSBdOyB0aGVuCj4gKwkJbm9k
ZV9tZW09JCgodG90YWxfbm9kZXMgLSAxKSkKPiArCQlub2RlX21lbT0kKChub2RlX21lbSAqIFBB
R0VTSVpFICogMTI4KSkKPiArCWZpCj4gKwo+ICsJZXZhbCAiJDE9JyQoKF9saW1pdCArIDQgKiBQ
QUdFU0laRSArIHRvdGFsX2NwdXMgKiBQQUdFU0laRSArIG5vZGVfbWVtKSknIgo+ICsJcmV0dXJu
IDAKPiArfQoKT3RoZXJ3aXNlIGxvb2tzIGdvb2QuCgotLSAKVGhhbmsgeW91LApSaWNoYXJkLgoK
LS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0
cAo=
