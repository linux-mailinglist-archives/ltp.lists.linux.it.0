Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB0E520E25
	for <lists+linux-ltp@lfdr.de>; Tue, 10 May 2022 08:51:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6C4963CA80D
	for <lists+linux-ltp@lfdr.de>; Tue, 10 May 2022 08:51:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 41BC33CA80D
 for <ltp@lists.linux.it>; Tue, 10 May 2022 08:51:14 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 1F29B600778
 for <ltp@lists.linux.it>; Tue, 10 May 2022 08:51:14 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C2F621FA00;
 Tue, 10 May 2022 06:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1652165473; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r7+qXxKIi0aF5wsgMwFez60TKqC8PT6uAVwBbD4Bgjw=;
 b=aK8lZs+D/58qjQyMzctskm8QBZXOutmPCOmtH5zzb15vqHeKKWE9ySnQcxPqk20phOxA0a
 e7qbPg+/5FquslYoa/OObggQRj/wwDYJ2gsTpI1P3lhPfTDkwR16rLxbUhgfg81KtEEyOd
 h5F7O6N8Id/cssLptzl/q/V5ZHWo254=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1652165473;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r7+qXxKIi0aF5wsgMwFez60TKqC8PT6uAVwBbD4Bgjw=;
 b=/J/nfdv+ewuFQVQ3ZoMQtDguG3kpSZzBY9kHzq7NUVroSTfcV7FUoUEiDK8ViWbVISl8BU
 PCMS6P19Eus8/JBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7A01213AA5;
 Tue, 10 May 2022 06:51:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EIVsHGELemIOZgAAMHmgww
 (envelope-from <pvorel@suse.cz>); Tue, 10 May 2022 06:51:13 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 10 May 2022 08:51:03 +0200
Message-Id: <20220510065104.1199-3-pvorel@suse.cz>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220510065104.1199-1-pvorel@suse.cz>
References: <20220510065104.1199-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v3 2/3] netns: Rewrite to use tst_net.sh
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
Cc: Martin Doucha <martin.doucha@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

VXNlIFRTVF9ORVRfU0tJUF9WQVJJQUJMRV9JTklUPTEgdGh1cyB3ZSBnZXQgbmV0d29yayBsaWJy
YXJ5CmZ1bmN0aW9uYWxpdHkgYnV0IHVzZSBpdCdzIG93biB0ZXN0IGxpbmtzLgoKVXNpbmcgdHN0
X25ldC5zaCBwcm92aWRlczoKKiBkZXRlY3Rpb24gb2YgZGlzYWJsZWQgSVB2NgoqIC02IHN1cHBv
cnQgaW5zdGVhZCBvZiBzcGVjaWZ5aW5nIGlwdjQvaXB2NgoqIHBpbmc2IGRldGVjdGlvbgoqIHVz
ZSB0c3RfaXBhZGRyX3VuKCkgdG8gZ2V0IHVudXNlZCBhZGRyZXNzZXMgaW5zdGVhZCBvZiBiYXNp
YyByYW5nZXMKICAxOTIuMTY4LjAueCAvIGZkMDA6OngKCkFsc28KKiBjbGVhbnVwIG90aGVyIHBh
cmFtZXRlciBoYW5kbGluZyAtIGluc3RlYWQgb2YgcGFzc2luZyA3IHBhcmFtZXRlcnMgdG8KICB0
aGUgc2V0dXAgdXNlIGFzIHRoZSBkZWZhdWx0IHRoZSBtb2Rlcm4gdmFyaWFudHMgKGlwIGFuZCBu
ZXRsaW5rKSwgdXNlCiAgc3dpdGNoZXMgZm9yIG90aGVyIHZhcmlhbnRzIChuc19leGVjIGFuZCBp
ZmNvbmZpZykKKiB1c2UgUk9EIHRvIHNob3J0ZW4gY29kZQoqIGNsZWFudXAgZHVwbGljYXRlIGRv
YwoKVE9ETzogVGVzdCBzaG91bGQgYmUgZnVydGhlciBjbGVhbnVwIHRvIHVzZSB0c3Rfcmhvc3Rf
cnVuIG92ZXIgZGlmZmVyZW50CkxUUF9ORVROUyBhbmQgdHN0X3BpbmcgaW5zdGVhZCBvZiAkdHBp
bmcgKGNoYW5nZXMgYWxyZWFkeSBiaWcgZW5vdWdoKS4KClNpZ25lZC1vZmYtYnk6IFBldHIgVm9y
ZWwgPHB2b3JlbEBzdXNlLmN6PgotLS0KY2hhbmdlcyB2Mi0+djM6CiogUmViYXNlZC4gJGRvX2Ns
ZWFudXAgaXMgbm93IHJlcXVpcmVkLiBUaGVyZSBjb3VsZCBiZSBhIHZhcmlhYmxlIGluCnRzdF9u
ZXQuc2ggb3IgZXZlbiB0c3RfdGVzdC5zaCB0byBzaWduYWwgdGhhdCBzZXR1cCBmdW5jdGlvbiBw
YXNzZWQsCmJ1dCBsZXQncyBwb3N0cG9uZSBpdCBmb3Igbm93LgoqIE1vdmVkIFRTVF9URVNURlVO
Qz0iZG9fdGVzdCIgaW50byB0ZXN0IGZpbGVzLCByZXN0IG9mIHRoZSB2YXJpYWJsZXMgaW4KICBu
ZXRuc19oZWxwZXIuc2guCiogVXNlIGNvbmRpdGlvbmFsIGV4cGFuc2lvbiBmb3IgVFNUX3tTRVRV
UCxDTEVBTlVQfS4KCiBydW50ZXN0L2NvbnRhaW5lcnMgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAgMzIgKy0tCiAuLi4va2VybmVsL2NvbnRhaW5lcnMvbmV0bnMvbmV0bnNfYnJlYWtucy5z
aCAgfCAgMzEgKy0tCiAuLi4va2VybmVsL2NvbnRhaW5lcnMvbmV0bnMvbmV0bnNfY29tbS5zaCAg
ICAgfCAgNTUgKy0tLQogLi4uL2tlcm5lbC9jb250YWluZXJzL25ldG5zL25ldG5zX2hlbHBlci5z
aCAgIHwgMjM4ICsrKysrKystLS0tLS0tLS0tLQogNCBmaWxlcyBjaGFuZ2VkLCAxMjIgaW5zZXJ0
aW9ucygrKSwgMjM0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3J1bnRlc3QvY29udGFpbmVy
cyBiL3J1bnRlc3QvY29udGFpbmVycwppbmRleCBlZWE3YmZhZGIuLmFiMGI5NGY1MSAxMDA2NDQK
LS0tIGEvcnVudGVzdC9jb250YWluZXJzCisrKyBiL3J1bnRlc3QvY29udGFpbmVycwpAQCAtMjUs
MjIgKzI1LDIyIEBAIG1xbnNfMDQgbXFuc18wNAogbXFuc18wNF9jbG9uZSBtcW5zXzA0IC1jbG9u
ZQogCiBuZXRuc19uZXRsaW5rIG5ldG5zX25ldGxpbmsKLW5ldG5zX2JyZWFrbnNfbnNfZXhlY19p
cHY0X25ldGxpbmsgbmV0bnNfYnJlYWtucy5zaCBuc19leGVjIGlwdjQgbmV0bGluawotbmV0bnNf
YnJlYWtuc19uc19leGVjX2lwdjZfbmV0bGluayBuZXRuc19icmVha25zLnNoIG5zX2V4ZWMgaXB2
NiBuZXRsaW5rCi1uZXRuc19icmVha25zX25zX2V4ZWNfaXB2NF9pb2N0bCBuZXRuc19icmVha25z
LnNoIG5zX2V4ZWMgaXB2NCBpb2N0bAotbmV0bnNfYnJlYWtuc19uc19leGVjX2lwdjZfaW9jdGwg
bmV0bnNfYnJlYWtucy5zaCBuc19leGVjIGlwdjYgaW9jdGwKLW5ldG5zX2JyZWFrbnNfaXBfaXB2
NF9uZXRsaW5rIG5ldG5zX2JyZWFrbnMuc2ggaXAgaXB2NCBuZXRsaW5rCi1uZXRuc19icmVha25z
X2lwX2lwdjZfbmV0bGluayBuZXRuc19icmVha25zLnNoIGlwIGlwdjYgbmV0bGluawotbmV0bnNf
YnJlYWtuc19pcF9pcHY0X2lvY3RsIG5ldG5zX2JyZWFrbnMuc2ggaXAgaXB2NCBpb2N0bAotbmV0
bnNfYnJlYWtuc19pcF9pcHY2X2lvY3RsIG5ldG5zX2JyZWFrbnMuc2ggaXAgaXB2NiBpb2N0bAot
bmV0bnNfY29tbV9uc19leGVjX2lwdjRfbmV0bGluayBuZXRuc19jb21tLnNoIG5zX2V4ZWMgaXB2
NCBuZXRsaW5rCi1uZXRuc19jb21tX25zX2V4ZWNfaXB2Nl9uZXRsaW5rIG5ldG5zX2NvbW0uc2gg
bnNfZXhlYyBpcHY2IG5ldGxpbmsKLW5ldG5zX2NvbW1fbnNfZXhlY19pcHY0X2lvY3RsIG5ldG5z
X2NvbW0uc2ggbnNfZXhlYyBpcHY0IGlvY3RsCi1uZXRuc19jb21tX25zX2V4ZWNfaXB2Nl9pb2N0
bCBuZXRuc19jb21tLnNoIG5zX2V4ZWMgaXB2NiBpb2N0bAotbmV0bnNfY29tbV9pcF9pcHY0X25l
dGxpbmsgbmV0bnNfY29tbS5zaCBpcCBpcHY0IG5ldGxpbmsKLW5ldG5zX2NvbW1faXBfaXB2Nl9u
ZXRsaW5rIG5ldG5zX2NvbW0uc2ggaXAgaXB2NiBuZXRsaW5rCi1uZXRuc19jb21tX2lwX2lwdjRf
aW9jdGwgbmV0bnNfY29tbS5zaCBpcCBpcHY0IGlvY3RsCi1uZXRuc19jb21tX2lwX2lwdjZfaW9j
dGwgbmV0bnNfY29tbS5zaCBpcCBpcHY2IGlvY3RsCituZXRuc19icmVha25zX2lwX2lwdjRfbmV0
bGluayBuZXRuc19icmVha25zLnNoCituZXRuc19icmVha25zX2lwX2lwdjZfbmV0bGluayBuZXRu
c19icmVha25zLnNoIC02CituZXRuc19icmVha25zX2lwX2lwdjRfaW9jdGwgbmV0bnNfYnJlYWtu
cy5zaCAtSQorbmV0bnNfYnJlYWtuc19pcF9pcHY2X2lvY3RsIG5ldG5zX2JyZWFrbnMuc2ggLTZJ
CituZXRuc19icmVha25zX25zX2V4ZWNfaXB2NF9uZXRsaW5rIG5ldG5zX2JyZWFrbnMuc2ggLWUK
K25ldG5zX2JyZWFrbnNfbnNfZXhlY19pcHY2X25ldGxpbmsgbmV0bnNfYnJlYWtucy5zaCAtNmUK
K25ldG5zX2JyZWFrbnNfbnNfZXhlY19pcHY0X2lvY3RsIG5ldG5zX2JyZWFrbnMuc2ggLWVJCitu
ZXRuc19icmVha25zX25zX2V4ZWNfaXB2Nl9pb2N0bCBuZXRuc19icmVha25zLnNoIC02ZUkKK25l
dG5zX2NvbW1faXBfaXB2NF9uZXRsaW5rIG5ldG5zX2NvbW0uc2gKK25ldG5zX2NvbW1faXBfaXB2
Nl9uZXRsaW5rIG5ldG5zX2NvbW0uc2ggLTYKK25ldG5zX2NvbW1faXBfaXB2NF9pb2N0bCBuZXRu
c19jb21tLnNoIC1JCituZXRuc19jb21tX2lwX2lwdjZfaW9jdGwgbmV0bnNfY29tbS5zaCAtNkkK
K25ldG5zX2NvbW1fbnNfZXhlY19pcHY0X25ldGxpbmsgbmV0bnNfY29tbS5zaCAtZQorbmV0bnNf
Y29tbV9uc19leGVjX2lwdjZfbmV0bGluayBuZXRuc19jb21tLnNoIC02ZQorbmV0bnNfY29tbV9u
c19leGVjX2lwdjRfaW9jdGwgbmV0bnNfY29tbS5zaCAtZUkKK25ldG5zX2NvbW1fbnNfZXhlY19p
cHY2X2lvY3RsIG5ldG5zX2NvbW0uc2ggLTZlSQogbmV0bnNfc3lzZnMgbmV0bnNfc3lzZnMuc2gK
IAogc2htbnN0ZXN0X25vbmUgc2htbnN0ZXN0IG5vbmUKZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9r
ZXJuZWwvY29udGFpbmVycy9uZXRucy9uZXRuc19icmVha25zLnNoIGIvdGVzdGNhc2VzL2tlcm5l
bC9jb250YWluZXJzL25ldG5zL25ldG5zX2JyZWFrbnMuc2gKaW5kZXggYjdmMjU1Y2I4Li4wYjJl
YjMxOWMgMTAwNzU1Ci0tLSBhL3Rlc3RjYXNlcy9rZXJuZWwvY29udGFpbmVycy9uZXRucy9uZXRu
c19icmVha25zLnNoCisrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvY29udGFpbmVycy9uZXRucy9uZXRu
c19icmVha25zLnNoCkBAIC0xLDIzICsxLDkgQEAKICMhL2Jpbi9zaAogIyBTUERYLUxpY2Vuc2Ut
SWRlbnRpZmllcjogR1BMLTIuMC1vci1sYXRlcgorIyBDb3B5cmlnaHQgKGMpIDIwMjIgUGV0ciBW
b3JlbCA8cHZvcmVsQHN1c2UuY3o+CiAjIENvcHlyaWdodCAoYykgS8O2cnkgTWFpbmNlbnQgPGtv
cnkubWFpbmNlbnRAYm9vdGxpbi5jb20+IDIwMjAKICMgQ29weXJpZ2h0IChjKSAyMDE1IFJlZCBI
YXQsIEluYy4KICMKLSMgU1lOT1BTSVM6Ci0jIG5ldG5zX2JyZWFrbnMuc2ggPE5TX0VYRUNfUFJP
R1JBTT4gPElQX1ZFUlNJT04+IDxDT01NX1RZUEU+Ci0jCi0jIE9QVElPTlM6Ci0jCSogTlNfRVhF
Q19QUk9HUkFNIChuc19leGVjfGlwKQotIwkJUHJvZ3JhbSB3aGljaCB3aWxsIGJlIHVzZWQgdG8g
ZW50ZXIgYW5kIHJ1biBvdGhlciBjb21tYW5kcwotIwkJaW5zaWRlIGEgbmV0d29yayBuYW1lc3Bh
Y2UuCi0jCSogSVBfVkVSU0lPTiAoaXB2NHxpcHY2KQotIwkJVmVyc2lvbiBvZiBJUC4gKGlwdjR8
aXB2NikKLSMJKiBDT01NX1RZUEUgKG5ldGxpbmt8aW9jdGwpCi0jCQlDb21tdW5pY2F0aW9uIHR5
cGUgYmV0d2VlbiBrZXJuZWwgYW5kIHVzZXIgc3BhY2UKLSMJCWZvciBiYXNpYyBzZXR1cDogZW5h
YmxpbmcgYW5kIGFzc2lnbmluZyBJUCBhZGRyZXNzZXMKLSMJCXRvIHRoZSB2aXJ0dWFsIGV0aGVy
bmV0IGRldmljZXMuIChVc2VzICdpcCcgY29tbWFuZCBmb3IgbmV0bGluawotIwkJYW5kICdpZmNv
bmZpZycgZm9yIGlvY3RsLikKLSMKICMgVGVzdHMgY29tbXVuaWNhdGlvbiB3aXRoIGlwICh1c2Vz
IG5ldGxpbmspIGFuZCBpZmNvbmZpZyAodXNlcyBpb2N0bCkKICMgb3ZlciBhIGRldmljZSB3aGlj
aCBpcyBub3QgdmlzaWJsZSBmcm9tIHRoZSBjdXJyZW50IG5ldHdvcmsgbmFtZXNwYWNlLgogIwpA
QCAtMjYsMTUgKzEyLDcgQEAKICMgMS4gdXNpbmcgbmV0bGluayAoaXAgY29tbWFuZCkuCiAjIDIu
IHVzaW5nIGlvY3RsIChpZmNvbmZpZyBjb21tYW5kKS4KIAotVFNUX1BPU19BUkdTPTMKLVRTVF9T
RVRVUD1kb19zZXR1cAotVFNUX1RFU1RGVU5DPWRvX3Rlc3QKLQotZG9fc2V0dXAoKQotewotCW5l
dG5zX3NldHVwICRQUk9HICRJUF9WRVIgJENPTV9UWVBFICIxOTIuMTY4LjAuMiIgIjE5Mi4xNjgu
MC4zIiAiZmQwMDo6MiIgImZkMDA6OjMiCi0JdHN0X3JlcyBUSU5GTyAiTlMgaW50ZXJhY3Rpb246
ICRQUk9HIHwgZGV2aWNlcyBzZXR1cDogJENPTV9UWVBFIgotfQorVFNUX1RFU1RGVU5DPSJkb190
ZXN0IgogCiBkb190ZXN0KCkKIHsKQEAgLTQ1LDkgKzIzLDQgQEAgZG9fdGVzdCgpCiB9CiAKIC4g
bmV0bnNfaGVscGVyLnNoCi0KLVBST0c9JDEKLUlQX1ZFUj0kMgotQ09NX1RZUEU9JDMKLQogdHN0
X3J1bgpkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9jb250YWluZXJzL25ldG5zL25ldG5z
X2NvbW0uc2ggYi90ZXN0Y2FzZXMva2VybmVsL2NvbnRhaW5lcnMvbmV0bnMvbmV0bnNfY29tbS5z
aAppbmRleCBiZWU5NDQ4MDIuLjY1NzBmMzg2ZSAxMDA3NTUKLS0tIGEvdGVzdGNhc2VzL2tlcm5l
bC9jb250YWluZXJzL25ldG5zL25ldG5zX2NvbW0uc2gKKysrIGIvdGVzdGNhc2VzL2tlcm5lbC9j
b250YWluZXJzL25ldG5zL25ldG5zX2NvbW0uc2gKQEAgLTEsMjMgKzEsOSBAQAogIyEvYmluL3No
CiAjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9yLWxhdGVyCisjIENvcHlyaWdo
dCAoYykgMjAyMiBQZXRyIFZvcmVsIDxwdm9yZWxAc3VzZS5jej4KICMgQ29weXJpZ2h0IChjKSBL
w7ZyeSBNYWluY2VudCA8a29yeS5tYWluY2VudEBib290bGluLmNvbT4gMjAyMAogIyBDb3B5cmln
aHQgKGMpIDIwMTUgUmVkIEhhdCwgSW5jLgogIwotIyBTWU5PUFNJUzoKLSMgbmV0bnNfY29tbS5z
aCA8TlNfRVhFQ19QUk9HUkFNPiA8SVBfVkVSU0lPTj4gPENPTU1fVFlQRT4KLSMKLSMgT1BUSU9O
UzoKLSMgICAgICAgKiBOU19FWEVDX1BST0dSQU0gKG5zX2V4ZWN8aXApCi0jICAgICAgICAgICAg
ICAgUHJvZ3JhbSB3aGljaCB3aWxsIGJlIHVzZWQgdG8gZW50ZXIgYW5kIHJ1biBvdGhlciBjb21t
YW5kcwotIyAgICAgICAgICAgICAgIGluc2lkZSBhIG5ldHdvcmsgbmFtZXNwYWNlLgotIyAgICAg
ICAqIElQX1ZFUlNJT04gKGlwdjR8aXB2NikKLSMgICAgICAgICAgICAgICBWZXJzaW9uIG9mIElQ
LiAoaXB2NHxpcHY2KQotIwkqIENPTU1fVFlQRSAobmV0bGlua3xpb2N0bCkKLSMJCUNvbW11bmlj
YXRpb24gdHlwZSBiZXR3ZWVuIGtlcm5lbCBhbmQgdXNlciBzcGFjZQotIwkJZm9yIGJhc2ljIHNl
dHVwOiBlbmFibGluZyBhbmQgYXNzaWduaW5nIElQIGFkZHJlc3NlcwotIwkJdG8gdGhlIHZpcnR1
YWwgZXRoZXJuZXQgZGV2aWNlcy4gKFVzZXMgJ2lwJyBjb21tYW5kIGZvciBuZXRsaW5rCi0jCQlh
bmQgJ2lmY29uZmlnJyBmb3IgaW9jdGwuKQotIwogIyBUZXN0cyB0aGF0IGEgc2VwYXJhdGUgbmV0
d29yayBuYW1lc3BhY2UgY2FuIGNvbmZpZ3VyZSBhbmQgY29tbXVuaWNhdGUKICMgb3ZlciB0aGUg
ZGV2aWNlcyBpdCBzZWVzLiBUZXN0cyBhcmUgZG9uZSB1c2luZyBuZXRsaW5rKDcpICgnaXAnIGNv
bW1hbmQpCiAjIG9yIGlvY3RsKDIpICgnaWZjb25maWcnIGNvbW1hbmQpIGZvciBjb250cm9sbGlu
ZyBkZXZpY2VzLgpAQCAtMjksNDMgKzE1LDI0IEBACiAjICAgMy4gY29tbXVuaWNhdGlvbiBvdmVy
IHRoZSBsbyAobG9jYWxob3N0KSBkZXZpY2UgaW4gYSBzZXBhcmF0ZQogIyAgICAgIG5ldHdvcmsg
bmFtZXNwYWNlCiAKLVRTVF9QT1NfQVJHUz0zCi1UU1RfU0VUVVA9ZG9fc2V0dXAKLVRTVF9URVNU
RlVOQz1kb190ZXN0Ci0KLWRvX3NldHVwKCkKLXsKLQluZXRuc19zZXR1cCAkUFJPRyAkSVBfVkVS
ICRDT01fVFlQRSAiMTkyLjE2OC4wLjIiICIxOTIuMTY4LjAuMyIgImZkMDA6OjIiICJmZDAwOjoz
IgotCXRzdF9yZXMgVElORk8gIk5TIGludGVyYWN0aW9uOiAkUFJPRyB8IGRldmljZXMgc2V0dXA6
ICRDT01fVFlQRSIKLX0KK1RTVF9URVNURlVOQz0iZG9fdGVzdCIKIAogZG9fdGVzdCgpCiB7Ci0J
RVhQRUNUX1BBU1MgJE5TX0VYRUMgJE5TX0hBTkRMRTAgJE5TX1RZUEUgJHRwaW5nIC1xIC1jMiAt
SSB2ZXRoMCAkSVAxIDE+L2Rldi9udWxsCisJbG9jYWwgaXBfbG89IjEyNy4wLjAuMSIKKwlbICIk
VFNUX0lQVjYiIF0gJiYgaXBfbG89Ijo6MSIKIAorCUVYUEVDVF9QQVNTICROU19FWEVDICROU19I
QU5ETEUwICROU19UWVBFICR0cGluZyAtcSAtYzIgLUkgdmV0aDAgJElQMSAxPi9kZXYvbnVsbAog
CUVYUEVDVF9QQVNTICROU19FWEVDICROU19IQU5ETEUxICROU19UWVBFICR0cGluZyAtcSAtYzIg
LUkgdmV0aDEgJElQMCAxPi9kZXYvbnVsbAogCi0JY2FzZSAiJElQX1ZFUiIgaW4KLQlpcHY0KSBp
cF9sbz0iMTI3LjAuMC4xIiA7OwotCWlwdjYpIGlwX2xvPSI6OjEiIDs7Ci0JZXNhYwotCWNhc2Ug
IiRDT01fVFlQRSIgaW4KLQluZXRsaW5rKQotCQkkTlNfRVhFQyAkTlNfSEFORExFMCAkTlNfVFlQ
RSBpcCBsaW5rIHNldCBkZXYgbG8gdXAgfHwgXAotCQkJdHN0X2JyayBUQlJPSyAiZW5hYmxpbmcg
bG8gZGV2aWNlIGZhaWxlZCIKLQkJOzsKLQlpb2N0bCkKLQkJJE5TX0VYRUMgJE5TX0hBTkRMRTAg
JE5TX1RZUEUgaWZjb25maWcgbG8gdXAgfHwgXAotCQkJdHN0X2JyayBUQlJPSyAiZW5hYmxpbmcg
bG8gZGV2aWNlIGZhaWxlZCIKLQkJOzsKLQllc2FjCisJaWYgWyAiJENPTU1fVFlQRSIgPSAibmV0
bGluayIgXTsgdGhlbgorCQlST0QgJE5TX0VYRUMgJE5TX0hBTkRMRTAgJE5TX1RZUEUgaXAgbGlu
ayBzZXQgZGV2IGxvIHVwCisJZWxzZQorCQlST0QgJE5TX0VYRUMgJE5TX0hBTkRMRTAgJE5TX1RZ
UEUgaWZjb25maWcgbG8gdXAKKwlmaQorCiAJRVhQRUNUX1BBU1MgJE5TX0VYRUMgJE5TX0hBTkRM
RTAgJE5TX1RZUEUgJHRwaW5nIC1xIC1jMiAtSSBsbyAkaXBfbG8gMT4vZGV2L251bGwKIH0KIAog
LiBuZXRuc19oZWxwZXIuc2gKLQotUFJPRz0kMQotSVBfVkVSPSQyCi1DT01fVFlQRT0kMwotCiB0
c3RfcnVuCmRpZmYgLS1naXQgYS90ZXN0Y2FzZXMva2VybmVsL2NvbnRhaW5lcnMvbmV0bnMvbmV0
bnNfaGVscGVyLnNoIGIvdGVzdGNhc2VzL2tlcm5lbC9jb250YWluZXJzL25ldG5zL25ldG5zX2hl
bHBlci5zaAppbmRleCBhNzRkOTIzZDEuLmU4YTA5MzQ3YSAxMDA3NTUKLS0tIGEvdGVzdGNhc2Vz
L2tlcm5lbC9jb250YWluZXJzL25ldG5zL25ldG5zX2hlbHBlci5zaAorKysgYi90ZXN0Y2FzZXMv
a2VybmVsL2NvbnRhaW5lcnMvbmV0bnMvbmV0bnNfaGVscGVyLnNoCkBAIC0xLDM2ICsxLDMwIEBA
CiAjIS9iaW4vc2gKICMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXIK
KyMgQ29weXJpZ2h0IChjKSAyMDIyIFBldHIgVm9yZWwgPHB2b3JlbEBzdXNlLmN6PgogIyBDb3B5
cmlnaHQgKGMpIExpbnV4IFRlc3QgUHJvamVjdCwgMjAxNC0yMDIxCiAjIENvcHlyaWdodCAoYykg
MjAxNSBSZWQgSGF0LCBJbmMuCiAKLVRTVF9DTEVBTlVQPW5ldG5zX25zX2V4ZWNfY2xlYW51cAog
VFNUX05FRURTX1JPT1Q9MQogVFNUX05FRURTX0NNRFM9ImlwIHBpbmciCiBUU1RfTkVFRFNfRFJJ
VkVSUz0idmV0aCIKIAotIyBTZXQgdG8gMSBvbmx5IGZvciB0ZXN0IGNhc2VzIHVzaW5nIGlmY29u
ZmlnIChpb2N0bCkuCi1VU0VfSUZDT05GSUc9MAorVFNUX09QVFM9ImVJIgorVFNUX1BBUlNFX0FS
R1M9Im5ldG5zX3BhcnNlX2FyZ3MiCitUU1RfVVNBR0U9Im5ldG5zX3VzYWdlIgorVFNUX1NFVFVQ
PSIke1RTVF9TRVRVUDotbmV0bnNfc2V0dXB9IgorVFNUX0NMRUFOVVA9IiR7VFNUX0NMRUFOVVA6
LW5ldG5zX2NsZWFudXB9IgogCi0jIFZhcmlhYmxlcyB3aGljaCBjYW4gYmUgdXNlZCBpbiB0ZXN0
IGNhc2VzIChzZXQgYnkgbmV0bnNfc2V0dXAoKSBmdW5jdGlvbik6CitUU1RfTkVUX1NLSVBfVkFS
SUFCTEVfSU5JVD0xCiAKLSMgVXNlIGluIHRlc3QgY2FzZXMgdG8gZXhlY3V0ZSBjb21tYW5kcyBp
bnNpZGUgYSBuYW1lc3BhY2UuIFNldCB0byAnbnNfZXhlYycgb3IKLSMgJ2lwIG5ldG5zIGV4ZWMn
IGNvbW1hbmQgYWNjb3JkaW5nIHRvIE5TX0VYRUNfUFJPR1JBTSBhcmd1bWVudCBzcGVjaWZpZWQg
aW4KLSMgbmV0bnNfc2V0dXAoKSBmdW5jdGlvbiBjYWxsLgotTlNfRVhFQz0KKyMgZnJvbSB0c3Rf
bmV0X3ZhcnMuYworSVBWNF9ORVQxNl9VTlVTRUQ9IjEwLjIzIgorSVBWNl9ORVQzMl9VTlVTRUQ9
ImZkMDA6MjMiCiAKICMgU2V0IHRvICJuZXQiIGZvciBuc19jcmVhdGUvbnNfZXhlYyBhcyB0aGVp
ciBvcHRpb25zIHJlcXVpcmVzCiAjIHRvIHNwZWNpZnkgYSBuYW1lc3BhY2UgdHlwZS4gRW1wdHkg
Zm9yIGlwIGNvbW1hbmQuCiBOU19UWVBFPQogCi0jIElQIGFkZHJlc3NlcyBvZiB2ZXRoMCAoSVAw
KSBhbmQgdmV0aDEgKElQMSkgZGV2aWNlcyAoaXB2NC9pcHY2IHZhcmlhbnQKLSMgaXMgZGV0ZXJt
aW5lZCBhY2NvcmRpbmcgdG8gdGhlIElQX1ZFUlNJT04gYXJndW1lbnQgc3BlY2lmaWVkIGluIG5l
dG5zX3NldHVwKCkKLSMgZnVuY3Rpb24gY2FsbC4KLUlQMD0KLUlQMT0KLU5FVE1BU0s9Ci0KLSMg
J3BpbmcnIG9yICdwaW5nNicgYWNjb3JkaW5nIHRvIHRoZSBJUF9WRVJTSU9OIGFyZ3VtZW50IHNw
ZWNpZmllZAotIyBpbiBuZXRuc19zZXR1cCgpIGZ1bmN0aW9uIGNhbGwuCisjICdwaW5nJyBvciAn
cGluZzYnCiB0cGluZz0KIAogIyBOZXR3b3JrIG5hbWVzcGFjZXMgaGFuZGxlcyBmb3IgbWFuaXB1
bGF0aW5nIGFuZCBleGVjdXRpbmcgY29tbWFuZHMgaW5zaWRlCkBAIC00NSwxMDcgKzM5LDczIEBA
IE5TX0hBTkRMRTE9CiAjIGlmY29uZmlnIDxkZXZpY2U+ICRJRkNPTkZfSU42X0FSRyBJUC9ORVRN
QVNLCiBJRkNPTkZfSU42X0FSRz0KIAotIyBTZXRzIHVwIGdsb2JhbCB2YXJpYWJsZXMgd2hpY2gg
Y2FuIGJlIHVzZWQgaW4gdGVzdCBjYXNlcyAoZG9jdW1lbnRlZCBhYm92ZSksCi0jIGNyZWF0ZXMg
dHdvIG5ldHdvcmsgbmFtZXNwYWNlcyBhbmQgYSBwYWlyIG9mIHZpcnR1YWwgZXRoZXJuZXQgZGV2
aWNlcywgZWFjaAotIyBkZXZpY2UgaW4gb25lIG5hbWVzcGFjZS4gRWFjaCBkZXZpY2UgaXMgdGhl
biBlbmFibGVkIGFuZCBhc3NpZ25lZCBhbiBJUAotIyBhZGRyZXNzIGFjY29yZGluZyB0byB0aGUg
ZnVuY3Rpb24gcGFyYW1ldGVycy4gSUZDT05GX0lONl9BUkcgdmFyaWFibGUgaXMgc2V0Ci0jIG9u
bHkgaWYgaXB2NiB2YXJpYW50IG9mIHRlc3QgY2FzZSBpcyB1c2VkIChkZXRlcm1pbmVkIGJ5IElQ
X1ZFUlNJT04gYXJndW1lbnQpLgotIwotIyBTWU5PUFNJUzoKLSMgbmV0bnNfc2V0dXAgPE5TX0VY
RUNfUFJPR1JBTT4gPElQX1ZFUlNJT04+IDxDT01NX1RZUEU+IDxJUDRfVkVUSDA+Ci0jICAgICAg
ICAgICAgIDxJUDRfVkVUSDE+IDxJUDZfVkVUSDA+IDxJUDZfVkVUSDE+Ci0jCi0jIE9QVElPTlM6
Ci0jCSogTlNfRVhFQ19QUk9HUkFNIChuc19leGVjfGlwKQotIwkJUHJvZ3JhbSB3aGljaCB3aWxs
IGJlIHVzZWQgdG8gZW50ZXIgYW5kIHJ1biBvdGhlciBjb21tYW5kcwotIwkJaW5zaWRlIGEgbmV0
d29yayBuYW1lc3BhY2UuCi0jCSogSVBfVkVSU0lPTiAoaXB2NHxpcHY2KQotIwkJVmVyc2lvbiBv
ZiBJUC4gKGlwdjR8aXB2NikKLSMJKiBDT01NX1RZUEUgKG5ldGxpbmt8aW9jdGwpCi0jCQlDb21t
dW5pY2F0aW9uIHR5cGUgYmV0d2VlbiBrZXJuZWwgYW5kIHVzZXIgc3BhY2UKLSMJCWZvciBlbmFi
bGluZyBhbmQgYXNzaWduaW5nIElQIGFkZHJlc3NlcyB0byB0aGUgdmlydHVhbAotIwkJZXRoZXJu
ZXQgZGV2aWNlcy4gVXNlcyAnaXAnIGNvbW1hbmQgZm9yIG5ldGxpbmsgYW5kICdpZmNvbmZpZycK
LSMJCWZvciBpb2N0bC4gKElmIHNldCB0byBpb2N0bCwgZnVuY3Rpb24gYWxzbyBjaGVja3MgdGhl
IGV4aXN0YW5jZQotIwkJb2YgdGhlICdpZmNvbmZpZycgY29tbWFuZC4pCi0jCSogSVA0X1ZFVEgw
LCBJUDRfVkVUSDEKLSMJCUlQdjQgYWRkcmVzc2VzIGZvciB2ZXRoMCBhbmQgdmV0aDEgZGV2aWNl
cy4KLSMJKiBJUDZfVkVUSDAsIElQNl9WRVRIMQotIwkJSVB2NiBhZGRyZXNzZXMgZm9yIHZldGgw
IGFuZCB2ZXRoMSBkZXZpY2VzLgotIwotIyBPbiBzdWNjZXNzIGZ1bmN0aW9uIHJldHVybnMsIG9u
IGVycm9yIHRzdF9icmsgaXMgY2FsbGVkIGFuZCBUQyBpcyB0ZXJtaW5hdGVkLgorIyBQcm9ncmFt
IHdoaWNoIHdpbGwgYmUgdXNlZCB0byBlbnRlciBhbmQgcnVuIG90aGVyIGNvbW1hbmRzIGluc2lk
ZSBhIG5ldHdvcmsgbmFtZXNwYWNlLgorIyAobnNfZXhlY3xpcCkKK05TX0VYRUM9ImlwIgorCisj
IENvbW11bmljYXRpb24gdHlwZSBiZXR3ZWVuIGtlcm5lbCBhbmQgdXNlciBzcGFjZSBmb3IgYmFz
aWMgc2V0dXA6IGVuYWJsaW5nIGFuZAorIyBhc3NpZ25pbmcgSVAgYWRkcmVzc2VzIHRvIHRoZSB2
aXJ0dWFsIGV0aGVybmV0IGRldmljZXMuIChVc2VzICdpcCcgY29tbWFuZCBmb3IKKyMgbmV0bGlu
ayBhbmQgJ2lmY29uZmlnJyBmb3IgaW9jdGwuKQorIyAobmV0bGlua3xpb2N0bCkKK0NPTU1fVFlQ
RT0ibmV0bGluayIKKworZG9fY2xlYW51cD0KKworbmV0bnNfcGFyc2VfYXJncygpCit7CisJY2Fz
ZSAkMSBpbgorCWUpIE5TX0VYRUM9Im5zX2V4ZWMiIDs7CisJSSkgQ09NTV9UWVBFPSJpb2N0bCI7
IHRzdF9yZXF1aXJlX2NtZHMgaWZjb25maWcgOzsKKwllc2FjCit9CisKK25ldG5zX3VzYWdlKCkK
K3sKKwllY2hvICJ1c2FnZTogJDAgWyAtZSBdIFsgLXQgXSIKKwllY2hvICJPUFRJT05TIgorCWVj
aG8gIi1lIHVzZSBuc19leGVjIGluc3RlYWQgb2YgaXAiCisJZWNobyAiLUkgdGVzdCBpb2N0bCAo
d2l0aCBpZmNvbmZpZykgaW5zdGVhZCBvZiBuZXRsaW5rICh3aXRoIGlwKSIKK30KKwogbmV0bnNf
c2V0dXAoKQogewotCWNhc2UgIiQxIiBpbgotCW5zX2V4ZWMpCisJaWYgWyAiJE5TX0VYRUMiID0g
ImlwIiBdOyB0aGVuCisJCW5ldG5zX2lwX3NldHVwCisJZWxzZQogCQlzZXRuc19jaGVjawogCQlb
ICQ/IC1lcSAzMiBdICYmIHRzdF9icmsgVENPTkYgInNldG5zIG5vdCBzdXBwb3J0ZWQiCiAKIAkJ
TlNfVFlQRT0ibmV0IgogCQluZXRuc19uc19leGVjX3NldHVwCi0JCVRTVF9DTEVBTlVQPW5ldG5z
X25zX2V4ZWNfY2xlYW51cAotCQk7OwotCWlwKQotCQluZXRuc19pcF9zZXR1cAotCQlUU1RfQ0xF
QU5VUD1uZXRuc19pcF9jbGVhbnVwCi0JCTs7Ci0JKikKLQkJdHN0X2JyayBUQlJPSyBcCi0JCSJm
aXJzdCBhcmd1bWVudCBtdXN0IGJlIGEgcHJvZ3JhbSB1c2VkIHRvIGVudGVyIGEgbmV0d29yayBu
YW1lc3BhY2UgKG5zX2V4ZWN8aXApIgotCQk7OwotCWVzYWMKLQotCWNhc2UgIiQzIiBpbgotCW5l
dGxpbmspCi0JCTs7Ci0JaW9jdGwpCi0JCVVTRV9JRkNPTkZJRz0xCi0JCXRzdF9yZXF1aXJlX2Nt
ZHMgaWZjb25maWcKLQkJOzsKLQkqKQotCQl0c3RfYnJrIFRCUk9LIFwKLQkJInRoaXJkIGFyZ3Vt
ZW50IG11c3QgYmUgYSBjb21tLiB0eXBlIGJldHdlZW4ga2VybmVsIGFuZCB1c2VyIHNwYWNlIChu
ZXRsaW5rfGlvY3RsKSIKLQkJOzsKLQllc2FjCi0KLQlpZiBbIC16ICIkNCIgXTsgdGhlbgotCQl0
c3RfYnJrIFRCUk9LICJmb3VydGggYXJndW1lbnQgbXVzdCBiZSB0aGUgSVB2NCBhZGRyZXNzIGZv
ciB2ZXRoMCIKLQlmaQotCWlmIFsgLXogIiQ1IiBdOyB0aGVuCi0JCXRzdF9icmsgVEJST0sgImZp
ZnRoIGFyZ3VtZW50IG11c3QgYmUgdGhlIElQdjQgYWRkcmVzcyBmb3IgdmV0aDEiCi0JZmkKLQlp
ZiBbIC16ICIkNiIgXTsgdGhlbgotCQl0c3RfYnJrIFRCUk9LICJzaXh0aCBhcmd1bWVudCBtdXN0
IGJlIHRoZSBJUHY2IGFkZHJlc3MgZm9yIHZldGgwIgotCWZpCi0JaWYgWyAteiAiJDciIF07IHRo
ZW4KLQkJdHN0X2JyayBUQlJPSyAic2V2ZW50aCBhcmd1bWVudCBtdXN0IGJlIHRoZSBJUHY2IGFk
ZHJlc3MgZm9yIHZldGgxIgogCWZpCiAKLQljYXNlICIkMiIgaW4KLQlpcHY0KQotCQlJUDA9JDQK
LQkJSVAxPSQ1Ci0JCXRwaW5nPSJwaW5nIgotCQlORVRNQVNLPTI0Ci0JCTs7Ci0JaXB2NikKKwlJ
UDA9JCh0c3RfaXBhZGRyX3VuIC1jIDEpCisJSVAxPSQodHN0X2lwYWRkcl91biAtYyAyKQorCisJ
aWYgWyAiJFRTVF9JUFY2IiBdOyB0aGVuCiAJCUlGQ09ORl9JTjZfQVJHPSJpbmV0NiBhZGQiCi0J
CUlQMD0kNgotCQlJUDE9JDcKLQotCQlpZiB0c3RfY21kX2F2YWlsYWJsZSBwaW5nNjsgdGhlbgot
CQkJdHBpbmc9InBpbmc2IgotCQllbHNlCi0JCQl0cGluZz0icGluZyAtNiIKLQkJCXRzdF9yZXNf
IFRJTkZPICJwaW5nNiBiaW5hcnkvc3ltbGluayBpcyBtaXNzaW5nLCB1c2luZyB3b3JrYXJvdW5k
LiBQbGVhc2UsIHJlcG9ydCBtaXNzaW5nIHBpbmc2IHRvIHlvdXIgZGlzdHJpYnV0aW9uLiIKLQkJ
ZmkKIAkJTkVUTUFTSz02NAotCQk7OwotCSopCi0JCXRzdF9icmsgVEJST0sgInNlY29uZCBhcmd1
bWVudCBtdXN0IGJlIGFuIGlwIHZlcnNpb24gKGlwdjR8aXB2NikiCi0JCTs7Ci0JZXNhYworCWVs
c2UKKwkJTkVUTUFTSz0yNAorCWZpCisKKwl0cGluZz1waW5nJFRTVF9JUFY2CiAKIAluZXRuc19z
ZXRfaXAKKworCXRzdF9yZXMgVElORk8gInRlc3RpbmcgbmV0bnMgb3ZlciAkQ09NTV9UWVBFIHdp
dGggJE5TX0VYRUMgJFBST0ciCisJZG9fY2xlYW51cD0xCit9CisKK25ldG5zX2NsZWFudXAoKQor
eworCVsgIiRkb19jbGVhbnVwIiBdIHx8IHJldHVybgorCisJaWYgWyAiJE5TX0VYRUMiID0gImlw
IiBdOyB0aGVuCisJCW5ldG5zX2lwX2NsZWFudXAKKwllbHNlCisJCW5ldG5zX25zX2V4ZWNfY2xl
YW51cAorCWZpCiB9CiAKICMgU2V0cyB1cCBOU19FWEVDIHRvIHVzZSAnbnNfZXhlYycsIGNyZWF0
ZXMgdHdvIG5ldHdvcmsgbmFtZXNwYWNlcyBhbmQgc3RvcmVzCkBAIC0xOTcsMjMgKzE1NywxOCBA
QCBuZXRuc19pcF9zZXR1cCgpCiAJaXAgbmV0bnMgZGVsICROU19IQU5ETEUwIDI+L2Rldi9udWxs
CiAJaXAgbmV0bnMgZGVsICROU19IQU5ETEUxIDI+L2Rldi9udWxsCiAKLQlpcCBuZXRucyBhZGQg
JE5TX0hBTkRMRTAgfHwgXAotCQl0c3RfYnJrIFRCUk9LICJ1bmFibGUgdG8gY3JlYXRlIGEgbmV3
IG5ldHdvcmsgbmFtZXNwYWNlIgotCWlwIG5ldG5zIGFkZCAkTlNfSEFORExFMSB8fCBcCi0JCXRz
dF9icmsgVEJST0sgInVuYWJsZSB0byBjcmVhdGUgYSBuZXcgbmV0d29yayBuYW1lc3BhY2UiCi0K
LQkkTlNfRVhFQyAkTlNfSEFORExFMCBpcCBsaW5rIGFkZCB2ZXRoMCB0eXBlIHZldGggcGVlciBu
YW1lIHZldGgxIHx8IFwKLQkJdHN0X2JyayBUQlJPSyAidW5hYmxlIHRvIGNyZWF0ZSB2ZXRoIHBh
aXIgZGV2aWNlcyIKKwlST0QgaXAgbmV0bnMgYWRkICROU19IQU5ETEUwCisJUk9EIGlwIG5ldG5z
IGFkZCAkTlNfSEFORExFMQogCi0JJE5TX0VYRUMgJE5TX0hBTkRMRTAgaXAgbGluayBzZXQgdmV0
aDEgbmV0bnMgJE5TX0hBTkRMRTEgfHwgXAotCQl0c3RfYnJrIFRCUk9LICJ1bmFibGUgdG8gYWRk
IGRldmljZSB2ZXRoMSB0byB0aGUgc2VwYXJhdGUgbmV0d29yayBuYW1lc3BhY2UiCisJUk9EICRO
U19FWEVDICROU19IQU5ETEUwIGlwIGxpbmsgYWRkIHZldGgwIHR5cGUgdmV0aCBwZWVyIG5hbWUg
dmV0aDEKKwlST0QgJE5TX0VYRUMgJE5TX0hBTkRMRTAgaXAgbGluayBzZXQgdmV0aDEgbmV0bnMg
JE5TX0hBTkRMRTEKIH0KIAogIyBFbmFibGVzIHZpcnR1YWwgZXRoZXJuZXQgZGV2aWNlcyBhbmQg
YXNzaWducyBJUCBhZGRyZXNzZXMgZm9yIGJvdGgKICMgb2YgdGhlbSAoSVB2NC9JUHY2IHZhcmlh
bnQgaXMgZGVjaWRlZCBieSBuZXRuc19zZXR1cCgpIGZ1bmN0aW9uKS4KIG5ldG5zX3NldF9pcCgp
CiB7Ci0JWyAiJE5TX0VYRUMiIF0gfHwgdHN0X2JyayBUQlJPSyAibmV0bnNfc2V0dXAoKSBmdW5j
dGlvbiBtdXN0IGJlIGNhbGxlZCBmaXJzdCIKKwlsb2NhbCBjbWQ9ImlwIgogCiAJIyBUaGlzIGFw
cGxpZXMgb25seSBmb3IgaXB2NiB2YXJpYW50OgogCSMgRG8gbm90IGFjY2VwdCBSb3V0ZXIgQWR2
ZXJ0aXNlbWVudHMgKGFjY2VwdF9yYSkgYW5kIGRvIG5vdCB1c2UKQEAgLTIyMiwzNSArMTc3LDI4
IEBAIG5ldG5zX3NldF9pcCgpCiAJIyB0aGVyZSBpcyBubyBvdGhlciBob3N0IHdpdGggdGhlIHNh
bWUgYWRkcmVzcywgdGhlIGFkZHJlc3MgaXMKIAkjIGNvbnNpZGVyZWQgdG8gYmUgInRlbnRhdGl2
ZSIgKGF0dGVtcHRzIHRvIGJpbmQoKSB0byB0aGUgYWRkcmVzcyBmYWlsCiAJIyB3aXRoIEVBRERS
Tk9UQVZBSUwpIHdoaWNoIG1heSBjYXVzZSBwcm9ibGVtcyBmb3IgdGVzdHMgdXNpbmcgaXB2Ni4K
LQllY2hvIDAgfCAkTlNfRVhFQyAkTlNfSEFORExFMCAkTlNfVFlQRSBcCi0JCXRlZSAvcHJvYy9z
eXMvbmV0L2lwdjYvY29uZi92ZXRoMC9hY2NlcHRfZGFkIFwKLQkJL3Byb2Mvc3lzL25ldC9pcHY2
L2NvbmYvdmV0aDAvYWNjZXB0X3JhID4vZGV2L251bGwKLQllY2hvIDAgfCAkTlNfRVhFQyAkTlNf
SEFORExFMSAkTlNfVFlQRSBcCi0JCXRlZSAvcHJvYy9zeXMvbmV0L2lwdjYvY29uZi92ZXRoMS9h
Y2NlcHRfZGFkIFwKLQkJL3Byb2Mvc3lzL25ldC9pcHY2L2NvbmYvdmV0aDEvYWNjZXB0X3JhID4v
ZGV2L251bGwKLQotCWNhc2UgJFVTRV9JRkNPTkZJRyBpbgotCTEpCi0JCSROU19FWEVDICROU19I
QU5ETEUwICROU19UWVBFIGlmY29uZmlnIHZldGgwICRJRkNPTkZfSU42X0FSRyAkSVAwLyRORVRN
QVNLIHx8Ci0JCQl0c3RfYnJrIFRCUk9LICJhZGRpbmcgYWRkcmVzcyB0byB2ZXRoMCBmYWlsZWQi
Ci0JCSROU19FWEVDICROU19IQU5ETEUxICROU19UWVBFIGlmY29uZmlnIHZldGgxICRJRkNPTkZf
SU42X0FSRyAkSVAxLyRORVRNQVNLIHx8Ci0JCQl0c3RfYnJrIFRCUk9LICJhZGRpbmcgYWRkcmVz
cyB0byB2ZXRoMSBmYWlsZWQiCi0JCSROU19FWEVDICROU19IQU5ETEUwICROU19UWVBFIGlmY29u
ZmlnIHZldGgwIHVwIHx8Ci0JCQl0c3RfYnJrIFRCUk9LICJlbmFibGluZyB2ZXRoMCBkZXZpY2Ug
ZmFpbGVkIgotCQkkTlNfRVhFQyAkTlNfSEFORExFMSAkTlNfVFlQRSBpZmNvbmZpZyB2ZXRoMSB1
cCB8fAotCQkJdHN0X2JyayBUQlJPSyAiZW5hYmxpbmcgdmV0aDEgZGV2aWNlIGZhaWxlZCIKLQkJ
OzsKLQkqKQotCQkkTlNfRVhFQyAkTlNfSEFORExFMCAkTlNfVFlQRSBpcCBhZGRyZXNzIGFkZCAk
SVAwLyRORVRNQVNLIGRldiB2ZXRoMCB8fAotCQkJdHN0X2JyayBUQlJPSyAiYWRkaW5nIGFkZHJl
c3MgdG8gdmV0aDAgZmFpbGVkIgotCQkkTlNfRVhFQyAkTlNfSEFORExFMSAkTlNfVFlQRSBpcCBh
ZGRyZXNzIGFkZCAkSVAxLyRORVRNQVNLIGRldiB2ZXRoMSB8fAotCQkJdHN0X2JyayBUQlJPSyAi
YWRkaW5nIGFkZHJlc3MgdG8gdmV0aDEgZmFpbGVkIgotCQkkTlNfRVhFQyAkTlNfSEFORExFMCAk
TlNfVFlQRSBpcCBsaW5rIHNldCB2ZXRoMCB1cCB8fAotCQkJdHN0X2JyayBUQlJPSyAiZW5hYmxp
bmcgdmV0aDAgZGV2aWNlIGZhaWxlZCIKLQkJJE5TX0VYRUMgJE5TX0hBTkRMRTEgJE5TX1RZUEUg
aXAgbGluayBzZXQgdmV0aDEgdXAgfHwKLQkJCXRzdF9icmsgVEJST0sgImVuYWJsaW5nIHZldGgx
IGRldmljZSBmYWlsZWQiCi0JCTs7Ci0JZXNhYworCWlmIFsgIiRUU1RfSVBWNiIgXTsgdGhlbgor
CQllY2hvIDAgfCAkTlNfRVhFQyAkTlNfSEFORExFMCAkTlNfVFlQRSBcCisJCQl0ZWUgL3Byb2Mv
c3lzL25ldC9pcHY2L2NvbmYvdmV0aDAvYWNjZXB0X2RhZCBcCisJCQkvcHJvYy9zeXMvbmV0L2lw
djYvY29uZi92ZXRoMC9hY2NlcHRfcmEgPi9kZXYvbnVsbAorCQllY2hvIDAgfCAkTlNfRVhFQyAk
TlNfSEFORExFMSAkTlNfVFlQRSBcCisJCQl0ZWUgL3Byb2Mvc3lzL25ldC9pcHY2L2NvbmYvdmV0
aDEvYWNjZXB0X2RhZCBcCisJCQkvcHJvYy9zeXMvbmV0L2lwdjYvY29uZi92ZXRoMS9hY2NlcHRf
cmEgPi9kZXYvbnVsbAorCWZpCisKKwlbICIkQ09NTV9UWVBFIiA9ICJpb2N0bCIgXSAmJiBjbWQ9
ImlmY29uZmlnIgorCisJaWYgWyAiJENPTU1fVFlQRSIgPSAibmV0bGluayIgXTsgdGhlbgorCQlS
T0QgJE5TX0VYRUMgJE5TX0hBTkRMRTAgJE5TX1RZUEUgaXAgYWRkcmVzcyBhZGQgJElQMC8kTkVU
TUFTSyBkZXYgdmV0aDAKKwkJUk9EICROU19FWEVDICROU19IQU5ETEUxICROU19UWVBFIGlwIGFk
ZHJlc3MgYWRkICRJUDEvJE5FVE1BU0sgZGV2IHZldGgxCisJCVJPRCAkTlNfRVhFQyAkTlNfSEFO
RExFMCAkTlNfVFlQRSBpcCBsaW5rIHNldCB2ZXRoMCB1cAorCQlST0QgJE5TX0VYRUMgJE5TX0hB
TkRMRTEgJE5TX1RZUEUgaXAgbGluayBzZXQgdmV0aDEgdXAKKwllbHNlCisJCVJPRCAkTlNfRVhF
QyAkTlNfSEFORExFMCAkTlNfVFlQRSBpZmNvbmZpZyB2ZXRoMCAkSUZDT05GX0lONl9BUkcgJElQ
MC8kTkVUTUFTSworCQlST0QgJE5TX0VYRUMgJE5TX0hBTkRMRTEgJE5TX1RZUEUgaWZjb25maWcg
dmV0aDEgJElGQ09ORl9JTjZfQVJHICRJUDEvJE5FVE1BU0sKKwkJUk9EICROU19FWEVDICROU19I
QU5ETEUwICROU19UWVBFIGlmY29uZmlnIHZldGgwIHVwCisJCVJPRCAkTlNfRVhFQyAkTlNfSEFO
RExFMSAkTlNfVFlQRSBpZmNvbmZpZyB2ZXRoMSB1cAorCWZpCiB9CiAKIG5ldG5zX25zX2V4ZWNf
Y2xlYW51cCgpCkBAIC0yNzYsNCArMjI0LDQgQEAgbmV0bnNfaXBfY2xlYW51cCgpCiAJaXAgbmV0
bnMgZGVsICROU19IQU5ETEUxIDI+L2Rldi9udWxsCiB9CiAKLS4gdHN0X3Rlc3Quc2gKKy4gdHN0
X25ldC5zaAotLSAKMi4zNi4wCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3Rz
LmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
