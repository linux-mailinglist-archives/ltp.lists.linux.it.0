Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D724148064
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Jan 2020 12:10:46 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 990F93C23F1
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Jan 2020 12:10:45 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 162053C0516
 for <ltp@lists.linux.it>; Fri, 24 Jan 2020 12:10:40 +0100 (CET)
Received: from m12-15.163.com (m12-15.163.com [220.181.12.15])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 975B71A027B9
 for <ltp@lists.linux.it>; Fri, 24 Jan 2020 12:10:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=J7eOq
 BD6M70EU7fbq0yGJQsId/QQ1jeWwFMJ//OhFBw=; b=WTn89xQa0ztn16x7ita1J
 cWwZS48nWSEY1sJlVkNCMGkfM2eVt+kMgnGALnzX0wKKeDpk4WWkH8GhJQaUA+aT
 C0OTo56qglff8CG6oEexlCIhXxhOd3xj2agRMkte4Hu6fs8WUCbAM0O/app/rg2Q
 ZWSP8fDuYiKWWYdWeQV8P4=
Received: from [192.168.0.103] (unknown [223.64.160.153])
 by smtp11 (Coremail) with SMTP id D8CowAC3CYqr0CpeWEfjAA--.215S2;
 Fri, 24 Jan 2020 19:10:36 +0800 (CST)
To: Martin Doucha <mdoucha@suse.cz>
References: <239304412.3515101.1579791334045.JavaMail.zimbra@redhat.com>
 <20200123151836.29484-1-mdoucha@suse.cz>
From: Yang Xu <xuyang_jy_0410@163.com>
Message-ID: <b2a63820-656c-de66-cde2-ce91c62e52b6@163.com>
Date: Fri, 24 Jan 2020 19:10:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200123151836.29484-1-mdoucha@suse.cz>
X-CM-TRANSID: D8CowAC3CYqr0CpeWEfjAA--.215S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJw45Xw4xWFyUXr1xWF15urg_yoW5ZF43pr
 47tw45ArsYqF10qF1xCF1IgF1UZw1S9rnxKFyYy3yIv3ZFkFyqqr12q3ZYqr1Iqa92qFW7
 Ka4fXF4rJ398XFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jh9NsUUUUU=
X-Originating-IP: [223.64.160.153]
X-CM-SenderInfo: p0x1t05jbm5saquriqqrwthudrp/1tbiXQa0hFWBh6R4ogABsH
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] Fix prctl02
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
Content-Type: text/plain; charset="gbk"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkKPiBUaGUgcHJjdGwoKSBzeXN0ZW0gY2FsbCB0YWtlcyA1IGludGVnZXIgYXJndW1lbnRzIGJ1
dCBvbmx5IDMgb2YgdGhlbSB3ZXJlCj4gcGFzc2VkIGluIHRoZSB0ZXN0LiBUaGlzIG1lYW5zIHRo
YXQgdGhlIHN5c3RlbSBjYWxsIHJlYWQgcmFuZG9tIGdhcmJhZ2UKPiBmcm9tIHN0YWNrIGluIHBs
YWNlIG9mIHRoZSB0d28gbWlzc2luZyBhcmd1bWVudHMgYW5kIGZhaWxlZCBldmVuIG9uIHNvbWUK
PiBwZXJmZWN0bHkgdmFsaWQgY29tYmluYXRpb25zIG9mIGFyZ3VtZW50cyBvbiBzb21lIHBsYXRm
b3Jtcy4KPiAKPiAtIENoYW5nZSBudW1faW52YWxpZCB0byBVTE9OR19NQVgKPiAtIEZpeCBhcmd1
bWVudHMgaW4gdGVzdCBjYXNlIDksIDEzIGFuZCAxNAo+IC0gRml4IHRlc3QgY2FsbCBvZiBwcmN0
bCgpIHRvIGhhdmUgYWxsIDUgYXJndW1lbnRzCmxvb2tzIHByY3RsIG1hbnBhZ2VzIGFuZCBrZXJu
ZWwgY29kZSwgeW91IGFyZSByaWdodCwgVGhhbmtzIGZvciB0aGUgZml4IQpGZWVsIGZyZWUgdG8g
YWRko6wKUmV2aWV3ZWQtYnk6IHh1eWFuZ19qeV8wNDEwQDE2My5jb20KVGVzdGVkLWJ5OiB4dXlh
bmdfanlfMDQxMEAxNjMuY29tCgpBbHNvLCBkbyB3ZSBzaG91bGQgdXNlIDUgYXJndW1lbnRzIGZv
ciBvdGhlciBwcmN0bCB0ZXN0IGNhc2VzPwoKQmVzdCBSZWdhcmRzCllhbmcgWHUKPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBNYXJ0aW4gRG91Y2hhIDxtZG91Y2hhQHN1c2UuY3o+Cj4gQ0M6IFlhbmcgWHUg
PHh1eWFuZzIwMTguanlAY24uZnVqaXRzdS5jb20+Cj4gLS0tCj4gIAo+IENoYW5nZXMgc2luY2Ug
djE6Cj4gLSBDaGFuZ2UgbnVtX2ludmFsaWQgdG8gVUxPTkdfTUFYCj4gLSBSZXR1cm4gcmVtb3Zl
ZCB0ZXN0IGNhc2VzIGFuZCBmaXggdGhlbSBpbnN0ZWFkCj4gCj4gICB0ZXN0Y2FzZXMva2VybmVs
L3N5c2NhbGxzL3ByY3RsL3ByY3RsMDIuYyB8IDExICsrKysrKy0tLS0tCj4gICAxIGZpbGUgY2hh
bmdlZCwgNiBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS90
ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3ByY3RsL3ByY3RsMDIuYyBiL3Rlc3RjYXNlcy9rZXJu
ZWwvc3lzY2FsbHMvcHJjdGwvcHJjdGwwMi5jCj4gaW5kZXggOTNmMzBiNTRhLi5lYmMwZTUwNjAg
MTAwNjQ0Cj4gLS0tIGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9wcmN0bC9wcmN0bDAyLmMK
PiArKysgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3ByY3RsL3ByY3RsMDIuYwo+IEBAIC00
MSw2ICs0MSw3IEBACj4gICAjaW5jbHVkZSA8dW5pc3RkLmg+Cj4gICAjaW5jbHVkZSA8c3RkbGli
Lmg+Cj4gICAjaW5jbHVkZSA8c3RkZGVmLmg+Cj4gKyNpbmNsdWRlIDxsaW1pdHMuaD4KPiAgICNp
bmNsdWRlICJjb25maWcuaCIKPiAgICNpbmNsdWRlICJsYXBpL3ByY3RsLmgiCj4gICAjaW5jbHVk
ZSAibGFwaS9zZWNjb21wLmgiCj4gQEAgLTY1LDcgKzY2LDcgQEAgc3RhdGljIHVuc2lnbmVkIGxv
bmcgYmFkX2FkZHI7Cj4gICBzdGF0aWMgdW5zaWduZWQgbG9uZyBudW1fMDsKPiAgIHN0YXRpYyB1
bnNpZ25lZCBsb25nIG51bV8xID0gMTsKPiAgIHN0YXRpYyB1bnNpZ25lZCBsb25nIG51bV8yID0g
MjsKPiAtc3RhdGljIHVuc2lnbmVkIGxvbmcgbnVtX2ludmFsaWQgPSA5OTk7Cj4gK3N0YXRpYyB1
bnNpZ25lZCBsb25nIG51bV9pbnZhbGlkID0gVUxPTkdfTUFYOwo+ICAgc3RhdGljIGludCBzZWNj
b21wX25zdXA7Cj4gICBzdGF0aWMgaW50IG5vbmV3cHJpdnNfbnN1cDsKPiAgIHN0YXRpYyBpbnQg
dGhwZGlzYWJsZV9uc3VwOwo+IEBAIC04NywxMiArODgsMTIgQEAgc3RhdGljIHN0cnVjdCB0Y2Fz
ZSB7Cj4gICAJe1BSX1NFVF9TRUNDT01QLCAmbnVtXzIsICZzdHJpY3RfYWRkciwgRUFDQ0VTLCAi
UFJfU0VUX1NFQ0NPTVAifSwKPiAgIAl7UFJfU0VUX1RJTUlORywgJm51bV8xLCAmbnVtXzAsIEVJ
TlZBTCwgIlBSX1NFVF9USU1JTkcifSwKPiAgIAl7UFJfU0VUX05PX05FV19QUklWUywgJm51bV8w
LCAmbnVtXzAsIEVJTlZBTCwgIlBSX1NFVF9OT19ORVdfUFJJVlMifSwKPiAtCXtQUl9TRVRfTk9f
TkVXX1BSSVZTLCAmbnVtXzEsICZudW1fMCwgRUlOVkFMLCAiUFJfU0VUX05PX05FV19QUklWUyJ9
LAo+ICsJe1BSX1NFVF9OT19ORVdfUFJJVlMsICZudW1fMSwgJm51bV8xLCBFSU5WQUwsICJQUl9T
RVRfTk9fTkVXX1BSSVZTIn0sCj4gICAJe1BSX0dFVF9OT19ORVdfUFJJVlMsICZudW1fMSwgJm51
bV8wLCBFSU5WQUwsICJQUl9HRVRfTk9fTkVXX1BSSVZTIn0sCj4gICAJe1BSX1NFVF9USFBfRElT
QUJMRSwgJm51bV8wLCAmbnVtXzEsIEVJTlZBTCwgIlBSX1NFVF9USFBfRElTQUJMRSJ9LAo+ICAg
CXtQUl9HRVRfVEhQX0RJU0FCTEUsICZudW1fMSwgJm51bV8xLCBFSU5WQUwsICJQUl9HRVRfVEhQ
X0RJU0FCTEUifSwKPiAtCXtQUl9DQVBfQU1CSUVOVCwgJm51bV8yLCAmbnVtXzEsIEVJTlZBTCwg
IlBSX0NBUF9BTUJJRU5UIn0sCj4gLQl7UFJfR0VUX1NQRUNVTEFUSU9OX0NUUkwsICZudW1fMSwg
Jm51bV8wLCBFSU5WQUwsICJQUl9HRVRfU1BFQ1VMQVRJT05fQ1RSTCJ9LAo+ICsJe1BSX0NBUF9B
TUJJRU5ULCAmbnVtX2ludmFsaWQsICZudW1fMCwgRUlOVkFMLCAiUFJfQ0FQX0FNQklFTlQifSwK
PiArCXtQUl9HRVRfU1BFQ1VMQVRJT05fQ1RSTCwgJm51bV8wLCAmbnVtX2ludmFsaWQsIEVJTlZB
TCwgIlBSX0dFVF9TUEVDVUxBVElPTl9DVFJMIn0sCj4gICAJe1BSX1NFVF9TRUNVUkVCSVRTLCAm
bnVtXzAsICZudW1fMCwgRVBFUk0sICJQUl9TRVRfU0VDVVJFQklUUyJ9LAo+ICAgCXtQUl9DQVBC
U0VUX0RST1AsICZudW1fMSwgJm51bV8wLCBFUEVSTSwgIlBSX0NBUEJTRVRfRFJPUCJ9LAo+ICAg
fTsKPiBAQCAtMTQwLDcgKzE0MSw3IEBAIHN0YXRpYyB2b2lkIHZlcmlmeV9wcmN0bCh1bnNpZ25l
ZCBpbnQgbikKPiAgIAlicmVhazsKPiAgIAl9Cj4gICAKPiAtCVRFU1QocHJjdGwodGMtPm9wdGlv
biwgKnRjLT5hcmcyLCAqdGMtPmFyZzMpKTsKPiArCVRFU1QocHJjdGwodGMtPm9wdGlvbiwgKnRj
LT5hcmcyLCAqdGMtPmFyZzMsIDAsIDApKTsKPiAgIAlpZiAoVFNUX1JFVCA9PSAwKSB7Cj4gICAJ
CXRzdF9yZXMoVEZBSUwsICJwcmN0bCgpIHN1Y2NlZWRlZCB1bmV4cGVjdGVkbHkiKTsKPiAgIAkJ
cmV0dXJuOwo+IAoKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5p
dC9saXN0aW5mby9sdHAK
