Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 453B84CD54
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Jun 2019 14:01:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0EA15298993
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Jun 2019 14:01:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 0C35C294AA9
 for <ltp@lists.linux.it>; Thu, 20 Jun 2019 14:01:27 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 62CDB14012C7
 for <ltp@lists.linux.it>; Thu, 20 Jun 2019 14:01:27 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B3FDEAF03;
 Thu, 20 Jun 2019 12:01:26 +0000 (UTC)
Date: Thu, 20 Jun 2019 14:01:22 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20190620120122.GB31382@dell5510>
References: <20190606114134.GB13068@rei.lan>
 <1560156706-13617-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1560156706-13617-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v3] sysctl/sysctl02: Add new regression test for
 overflow file-max
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGksCgpMR1RNLCBiZWxvdyBhcmUganVzdCBzbWFsbCBmb3JtYXR0aW5nIGlzc3Vlcy4KSSdtIGdv
aW5nIHRvIG1lcmdlIGl0IHdpdGggdGhlc2UgY2hhbmdlcyBiZWxvdy4KCj4gT24gdXBzdHJlYW0g
a2VybmVsLCBiZWZvcmUgY29tbWl0WzFdLCB0aGUgbWF4IHZhbHVlIGluIHByb2NfZ2V0X2xvbmcg
YmFzZWQgb24KPiB0aGUgbnVtYmVyIG9mIGNoYXJzKDIxKS4gSXQgcmVqZWN0cyB2YWx1ZXMgc3Vj
aCBhcyAxODQ0Njc0NDA3MzcwOTU1MTYxNjAgKDIxIGNoYXJzKQo+IGJ1dCBhY2NlcHRzIHZhbHVl
cyBzdWNoIGFzIDE4NDQ2NzQ0MDczNzA5NTUxNjE2ICgyMCBjaGFycykuIEJ1dCB3ZSBzaG91bGQg
cmVqZWN0IGFsbAo+IGJlY2F1c2UgYm90aCBhcmUgb3ZlcmZsb3dzLiBBZnRlciB0aGlzIGNvbW1p
dCx0aGUgcGVybWl0dGVkIG1heCB2YWx1ZSBpcyAyXjY0LTEuCgo+IEJlZm9yZSBjb21taXRbMl0s
IHdoZW4gd3JpdGluZyBlY2hvIDE4NDQ2NzQ0MDczNzA5NTUxNjE2ID4gL3Byb2Mvc3lzL2ZzL2Zp
bGUtbWF4Cj4gL3Byb2Mvc3lzL2ZzL2ZpbGUtbWF4IHdpbGwgb3ZlcmZsb3cgYW5kIGJlIHNldCB0
byAwLiAgSXQgbWF5IGNyYXNoIHRoZSBzeXN0ZW0uIFRoaXMKPiBjb21taXQgc2V0cyB0aGUgbWF4
IGFuZCBtaW4gdmFsdWUgZm9yIGZpbGUtbWF4LiBBZnRlciB0aGlzIGNvbW1pdCx0aGUgcGVybWl0
dGVkIG1heAo+IHZhbHVlIGlzIDJeNjMtMS4KCj4gVW5mb3J0dW5hdGVseSwgY29tbWl0WzJdIGlu
dHJvZHVjZWQgdGhlIG1pbmltdW0gdmFsdWUgcG9pbnRzIGF0IHRoZSBnbG9iYWwgJ3plcm8nCj4g
dmFyaWFibGUgd2hpY2ggaXMgYW4gaW50LiBUaGlzIHJlc3VsdHMgaW4gYSBLQVNBTiBzcGxhdCB3
aGVuIGFjY2Vzc2VkIGFzIGEgbG9uZyBieQo+IHByb2NfZG91bG9uZ3ZlY19taW5tYXggb24gNjQt
Yml0IGFyY2hpdGVjdHVyZXMuIFRoaXMgYnVnIGhhcyBiZWVuIGZpeGVkIGJ5IGNvbW1pdFszXS4K
Cj4gSSB3aWxsIHNldCAyXjY0ICwyXjY0LTEsMl42MyBhbmQgMCB0byBmaWxlLW1heCBpbiBjYXNl
IGFuZCB0ZXN0IGl0LgoKPiBbMV1odHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgv
a2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvY29tbWl0Lz9pZD03ZjI5MjNjNGY3M2YyMWNm
ZDcxNGQxMmEyZDQ4ZGU4YzIxZjExY2ZlCj4gWzJdaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIv
c2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L2NvbW1pdC8/aWQ9MzJhNWFk
OWMyMjg1MmU2YmQ5ZTc0YmRlYzU5MzRlZjlkMTQ4MGJjNQo+IFszXWh0dHBzOi8vZ2l0Lmtlcm5l
bC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC9jb21taXQv
P2lkPTkwMDJiMjE0NjVmYTRkODI5ZWRmYzk0YTVhNDQxMDA1Y2ZmYWE5NzIKCj4gU2lnbmVkLW9m
Zi1ieTogWWFuZyBYdSA8eHV5YW5nMjAxOC5qeUBjbi5mdWppdHN1LmNvbT4KPiAtLS0KPiAgcnVu
dGVzdC9jb21tYW5kcyAgICAgICAgICAgICAgICAgICAgICB8ICAxICsKPiAgdGVzdGNhc2VzL2Nv
bW1hbmRzL3N5c2N0bC9zeXNjdGwwMi5zaCB8IDk2ICsrKysrKysrKysrKysrKysrKysrKysrKysr
Kwo+ICAyIGZpbGVzIGNoYW5nZWQsIDk3IGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAw
NzU1IHRlc3RjYXNlcy9jb21tYW5kcy9zeXNjdGwvc3lzY3RsMDIuc2gKCj4gZGlmZiAtLWdpdCBh
L3J1bnRlc3QvY29tbWFuZHMgYi9ydW50ZXN0L2NvbW1hbmRzCj4gaW5kZXggYWMxNWU4YjIzLi4x
ODcwYzQyMDkgMTAwNjQ0Cj4gLS0tIGEvcnVudGVzdC9jb21tYW5kcwo+ICsrKyBiL3J1bnRlc3Qv
Y29tbWFuZHMKPiBAQCAtNDAsMyArNDAsNCBAQCBrZXljdGwwMV9zaCBrZXljdGwwMS5zaAo+ICBn
ZGIwMV9zaCBnZGIwMS5zaAo+ICB1bnNoYXJlMDFfc2ggdW5zaGFyZTAxLnNoCj4gIHN5c2N0bDAx
X3NoIHN5c2N0bDAxLnNoCj4gK3N5c2N0bDAyX3NoIHN5c2N0bDAyLnNoCj4gZGlmZiAtLWdpdCBh
L3Rlc3RjYXNlcy9jb21tYW5kcy9zeXNjdGwvc3lzY3RsMDIuc2ggYi90ZXN0Y2FzZXMvY29tbWFu
ZHMvc3lzY3RsL3N5c2N0bDAyLnNoCj4gbmV3IGZpbGUgbW9kZSAxMDA3NTUKPiBpbmRleCAwMDAw
MDAwMDAuLjIyZGQwYTQyOQo+IC0tLSAvZGV2L251bGwKPiArKysgYi90ZXN0Y2FzZXMvY29tbWFu
ZHMvc3lzY3RsL3N5c2N0bDAyLnNoCj4gQEAgLTAsMCArMSw5NiBAQAo+ICsjIS9iaW4vc2gKPiAr
Cj4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXIKPiArIyBDb3B5
cmlnaHQgKGMpIDIwMTkgRlVKSVRTVSBMSU1JVEVELiBBbGwgcmlnaHRzIHJlc2VydmVkLgo+ICsj
IEF1dGhvcjogWWFuZyBYdTx4dXlhbmcyMDE4Lmp5QGNuLmZ1aml0c3UuY29tPgo+ICsjCj4gKyMg
RGVzY3JpcHRpb246Cj4gKyMgVGhpcyBpcyBhIHJlZ3Jlc3Npb24gdGVzdCBmb3IgaGFuZGxpbmcg
b3ZlcmZsb3cgZm9yIGZpbGUtbWF4LgpJbnN0ZWFkIHRoZXNlIDIgbGluZXMgSSdkIHB1dCBqdXN0
IHRoaXMgKG5pdCk6CiMgUmVncmVzc2lvbiB0ZXN0IGZvciBoYW5kbGluZyBvdmVyZmxvdyBmb3Ig
ZmlsZS1tYXguCgo+ICsjCj4gKyMgd2hlbiB3cml0aW5nIDJeNjQgdG8gL3Byb2Mvc3lzL2ZzL2Zp
bGUtbWF4LiBJdCB3aWxsIG92ZXJmbG93Cj4gKyMgYW5kIGJlIHNldCB0byAwLiBJdCBjcmFzaCBz
eXN0ZW0gcXVpY2tseS4KPiArIwo+ICsjIFRoZSBrZXJuZWwgYnVnIGhhcyBiZWVuIGZpeGVkIGlu
IGtlcm5lbDoKPiArIyAnN2YyOTIzYzRmJyAoc3lzY3RsOiBoYW5kbGUgb3ZlcmZsb3cgaW4gcHJv
Y19nZXRfbG9uZykKPiArIyB0aGUgcGVybWl0dGVkIG1heCB2YWx1ZSBpcyAgMl42NC0xLgo+ICsj
ICczMmE1YWQ5YzInIChzeXNjdGw6IGhhbmRsZSBvdmVyZmxvdyBmb3IgZmlsZS1tYXgpCj4gKyMg
dGhlIHBlcm1pdHRlZCBtYXggdmFsdWUgaXMgMl42My0xCj4gKyMKPiArIyBBZnRlciBtZXJnZWQg
dGhpcyBwYXRjaHNldCwgaWYgd2UgZXhjZWVkIHRoZSBtYXggdmFsdWUsIGl0IHdpbGwKPiArIyBr
ZWVwIG9sZCB2YWx1ZS4gVW5mb3J0dW5hdGVseSwgaXQgaW50cm91ZGNlZCBhIG5ldyBidWcgd2hl
biBzZXQgaXQKPiArIyB0byAwIGFuZCBpdCB3aWxsIGxlYWQgdG8gc3lzdGVtIGNyYXNoLgo+ICsj
IFRoaXMgYnVnIGhhcyBiZWVuIGZpeGVkIGJ5IGNvbW1pdCA5MDAyYjIxNDYKPiArIyAoa2VybmVs
L3N5c2N0bC5jOiBmaXggb3V0LW9mLWJvdW5kcyBhY2Nlc3Mgd2hlbiBzZXR0aW5nIGZpbGUtbWF4
KQo+ICsKPiArVFNUX1RFU1RGVU5DPWRvX3Rlc3QKPiArVFNUX1NFVFVQPXNldHVwCj4gK1RTVF9D
TEVBTlVQPWNsZWFudXAKPiArVFNUX0NOVD00Cj4gK1RTVF9ORUVEU19ST09UPTEKPiArVFNUX05F
RURTX0NNRFM9InN5c2N0bCIKPiArZGlyPSIvcHJvYy9zeXMvZnMvIgo+ICtzeW1zX2ZpbGU9Ii9w
cm9jL2thbGxzeW1zIgo+ICtuYW1lPSJmaWxlLW1heCIKPiArb3JpZ192YWx1ZT0yMDAwMDAKPiAr
Cj4gKy4gdHN0X3Rlc3Quc2gKPiArCj4gK3NldHVwKCkKPiArewo+ICsJWyAhIC1mICIkZGlyIiIk
bmFtZSIgXSAmJiB0c3RfYnJrIFRDT05GIFwKPiArCQkiJG5hbWUgd2FzIG5vdCBzdXBwb3J0ZWQi
ClsgISAtZiAiJGRpciRuYW1lIiBdICYmIHRzdF9icmsgVENPTkYgIiRuYW1lIHdhcyBub3Qgc3Vw
cG9ydGVkIgoKPiArCW9yaWdfdmFsdWU9JChjYXQgIiRkaXIiIiRuYW1lIikKPiArfQo+ICsKPiAr
ZG9fdGVzdCgpCj4gK3sKPiArCWNhc2UgJDEgaW4KPiArCTEpc3lzY3RsX3Rlc3Rfb3ZlcmZsb3cg
MTg0NDY3NDQwNzM3MDk1NTE2MTY7Owo+ICsJMilzeXNjdGxfdGVzdF9vdmVyZmxvdyAxODQ0Njc0
NDA3MzcwOTU1MTYxNTs7Cj4gKwkzKXN5c2N0bF90ZXN0X292ZXJmbG93IDkyMjMzNzIwMzY4NTQ3
NzU4MDg7Owo+ICsJNClzeXNjdGxfdGVzdF96ZXJvOzsKPiArCWVzYWMKPiArfQo+ICsKPiArc3lz
Y3RsX3Rlc3Rfb3ZlcmZsb3coKQo+ICt7Cj4gKwlsb2NhbCBvbGRfdmFsdWU9JChjYXQgIiRkaXIi
IiRuYW1lIikKPiArCj4gKwlzeXNjdGwgLXcgImZzLmZpbGUtbWF4Ij0kMSA+L2Rldi9udWxsIDI+
JjEKPiArCj4gKwlsb2NhbCB0ZXN0X3ZhbHVlPSQoY2F0ICIkZGlyIiIkbmFtZSIpCmFnYWluLCB3
aHkgMiBzdGluZ3MgaW5zdGVhZCBvZiBvbmU/CmxvY2FsIHRlc3RfdmFsdWU9JChjYXQgIiRkaXIk
bmFtZSIpCgo+ICsKPiArCWVjaG8gJHt0ZXN0X3ZhbHVlfSB8Z3JlcCAtcSAke29sZF92YWx1ZX0K
PiArCWlmIFsgJD8gLWVxIDAgXTsgdGhlbgo+ICsJCXRzdF9yZXMgVFBBU1MgImZpbGUtbWF4IG92
ZXJmbG93LCByZWplY3QgaXQgYW5kIGtlZXAgb2xkIHZhbHVlLiIKUGxlYXNlIGRvbid0IHVzZSBk
b3QKCj4gKwllbHNlCj4gKwkJdHN0X3JlcyBURkFJTCAiZmlsZS1tYXggb3ZlcmZsb3cgYW5kIHNl
dCBpdCB0byAke3Rlc3RfdmFsdWV9LiIKSGVyZSBhcyB3ZWxsLgoKPiArCWZpCj4gKwljbGVhbnVw
Cj4gK30KPiArCj4gK3N5c2N0bF90ZXN0X3plcm8oKQo+ICt7Cj4gKwlzeXNjdGwgLXcgImZzLmZp
bGUtbWF4Ij0wID4vZGV2L251bGwgMj4mMQpQbGVhc2UgdXNlIC1xIG9wdGlvbiBpbnN0ZWFkIG9m
IHJlZGlyZWN0aW5nLgo+ICsJWyAhIC1mICIkc3ltc19maWxlIiBdICYmIHRzdF9icmsgVENPTkYg
XAo+ICsJCSIkc3ltc19maWxlIHdhcyBub3Qgc3VwcG9ydGVkIgoKPiArCWNhdCAkc3ltc19maWxl
ICB8Z3JlcCBrYXNhbl9yZXBvcnQgPi9kZXYvbnVsbCAyPiYxCj4gKwlpZiBbICQ/IC1lcSAwIF07
IHRoZW4KQWxzbyBncmVwIGhhcyAtcSwgbm8gbmVlZCB0byB1c2UgcGlwZToKCmlmIGdyZXAgLXEg
a2FzYW5fcmVwb3J0ICRzeW1zX2ZpbGU7IHRoZW4KCj4gKwkJZG1lc2cgfCBncmVwICJLQVNBTjog
Z2xvYmFsLW91dC1vZi1ib3VuZHMgaW4gX19kb19wcm9jX2RvdWxvbmd2ZWNfbWlubWF4IiA+L2Rl
di9udWxsCi1xIGhlcmUgYXMgd2VsbC4KCj4gKwkJaWYgWyAkPyAtZXEgMCBdOyB0aGVuCj4gKwkJ
CXRzdF9yZXMgVEZBSUwgImZpbGUtbWF4IGlzIHNldCAwIGFuZCB0cmlnZ2VyIGEgS0FTQU4gZXJy
b3IiCj4gKwkJZWxzZQo+ICsJCQl0c3RfcmVzIFRQQVNTIFwKPiArCQkJCSJmaWxlLW1heCBpcyBz
ZXQgMCBhbmQgZG9lc24ndCB0cmlnZ2VyIGEgS0FTQU4gZXJyb3IiClByb2JhYmx5IGNhbiBiZSBv
biBzaW5nbGUgbGluZS4KCj4gKwkJZmkKPiArCWVsc2UKPiArCQl0c3RfcmVzIFRDT05GICJrZXJu
ZWwgZG9lc24ndCBzdXBwb3J0IEtBU0FOIgo+ICsJZmkKPiArfQo+ICsKPiArY2xlYW51cCgpCj4g
K3sKPiArCXN5c2N0bCAtdyAiZnMuIiIkbmFtZSI9JHtvcmlnX3ZhbHVlfSA+L2Rldi9udWxsIDI+
JjEKSXQncyBzYWZlIG5vdCBxdW90ZSBzdHJpbmcgKCRuYW1lIGlzIHNhZmUsIGJ1dCB5b3UgY2Fu
IG9mIGNvdXJzZSkKc3lzY3RsIC1xIC13IGZzLiRuYW1lPSRvcmlnX3ZhbHVlCgo+ICt9Cj4gKwo+
ICt0c3RfcnVuCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQv
bGlzdGluZm8vbHRwCg==
