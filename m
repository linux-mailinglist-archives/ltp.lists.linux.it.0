Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DD65219D503
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Apr 2020 12:26:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9B7F93C2FAE
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Apr 2020 12:26:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 83D4B3C2F83
 for <ltp@lists.linux.it>; Fri,  3 Apr 2020 12:26:49 +0200 (CEST)
Received: from m12-14.163.com (m12-14.163.com [220.181.12.14])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 0AF231A0178F
 for <ltp@lists.linux.it>; Fri,  3 Apr 2020 12:26:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Mime-Version:Message-ID:Subject:Date:From; bh=xtLpE
 JEA1s3KAedNFA4i/snjFmc70mZwdaT6DXWqPsA=; b=lznakJ4Mb8R6+lKds2GqV
 xAhqFs1gt9BLQ42ZaZsVT35FYh2PzIoTpK9qED5UaUrDqJiQNZNxd2QMC0ejYMO5
 uEJyBNzl79DwbOxqhQZIPNLsl89ObCdGKVXyAj4V2o7bJvxhn5WSmEbZKeK5Fkid
 1wKa5mOZgnv4BXwl9cv1+M=
Received: from localhost (unknown [117.136.46.76])
 by smtp10 (Coremail) with SMTP id DsCowADX3U1iD4de6Eo0Cg--.11S2;
 Fri, 03 Apr 2020 18:26:43 +0800 (CST)
Mime-Version: 1.0
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
Message-ID: 
Date: Fri, 3 Apr 2020 18:26:41 +0800 (GMT+08:00)
From: =?UTF-8?B?eHV5YW5nX2p5XzA0MTBAMTYzLmNvbQ==?=<xuyang_jy_0410@163.com>
To: =?UTF-8?B?WGlhbyBZYW5n?=<yangx.jy@cn.fujitsu.com>
X-CM-TRANSID: DsCowADX3U1iD4de6Eo0Cg--.11S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uFyxWr15XrWktFW3Ww1ftFb_yoW8Cw1Upr
 4fGr4DGFWFq398ta1kWF1Fgr47uF4IvF1UAF13tr12yF42krnYqrn3CFW7KryUAr1UZF42
 yw1Dtw1SkFWDJaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jD0edUUUUU=
X-Originating-IP: [117.136.46.76]
X-CM-SenderInfo: p0x1t05jbm5saquriqqrwthudrp/xtbBzgX6hFQHITtrQwAAsU
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=1.2 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,FROM_EXCESS_BASE64,
 FROM_MISSP_FREEMAIL,HTML_MESSAGE,MIME_BASE64_TEXT,MIME_HTML_MOSTLY,
 MPART_ALT_DIFF,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] ltp_tpci.c: fix a null pointer
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
Cc: =?UTF-8?B??= <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1285225606=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1285225606==
Content-Type: multipart/alternative; 
	boundary="----=_Part_0_151453552.1585909602686"

------=_Part_0_151453552.1585909602686
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: base64


------=_Part_0_151453552.1585909602686
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PGRpdj5IaSB4aWFvPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5JIG9ubHkgZml4ZWQgdGhlIG51
bGwgcG9pbnRlci4gdGhlIHN1YiB0ZXN0MTMgZmFpbCBpcyBub3QgcmVsYXRlZCB0byBteSBwYXRj
aO+8jCBpdCBmYWlscyBiZWNhdXNlIG9mIG5vIGVub3VnaCBtZW1vcnkgcmFuZ2UgZm9yIHBjaS4g
SSB3aWxsIGxvb2sgaW50byB0aGlzIGZhaWx1cmUgbmV4dCB3ZWVrLiBCdXQgaXQgc2hvdWxkIG5v
dCBibG9jayB0aGlzIGZpeC48L2Rpdj48ZGl2PkJlc3QgUmVnYXJkczwvZGl2PjxkaXY+WWFuZyBY
dTwvZGl2PjxkaXY+PCEtLWVtcHR5c2lnbi0tPjwvZGl2PjxkaXY+PGRpdiBzdHlsZT0iZm9udC1z
aXplOjEycHg7cGFkZGluZzoycHggMDsiPi0tLU9yaWdpbmFsLS0tPC9kaXY+PGRpdiBzdHlsZT0i
Zm9udC1zaXplOjEycHg7YmFja2dyb3VuZDojZjBmMGYwO2NvbG9yOiMyMTIxMjE7cGFkZGluZzo4
cHghaW1wb3J0YW50O2JvcmRlci1yYWRpdXM6NHB4O2xpbmUtaGVpZ2h0OjEuNTsiPjxkaXY+PGI+
RnJvbTo8L2I+ICJYaWFvIFlhbmciJmx0O3lhbmd4Lmp5QGNuLmZ1aml0c3UuY29tJmd0OzwvZGl2
PjxkaXY+PGI+RGF0ZTo8L2I+IEZyaSwgQXByIDMsIDIwMjAgMTg6MTEgUE08L2Rpdj48ZGl2Pjxi
PlRvOjwvYj4gIllhbmcgWHUiJmx0O3h1eWFuZzIwMTguanlAY24uZnVqaXRzdS5jb20mZ3Q7Ozwv
ZGl2PjxkaXY+PGI+Q2M6PC9iPiAibHRwIiZsdDtsdHBAbGlzdHMubGludXguaXQmZ3Q7OzwvZGl2
PjxkaXY+PGI+U3ViamVjdDo8L2I+IFJlOiBbTFRQXSBbUEFUQ0hdIGx0cF90cGNpLmM6IGZpeCBh
IG51bGwgcG9pbnRlcjwvZGl2PjwvZGl2Pjxicj5PbiZuYnNwOzIwMjAvMy8xOCZuYnNwOzEyOjU1
LCZuYnNwO1lhbmcmbmJzcDtYdSZuYnNwO3dyb3RlOjxicj4mZ3Q7Jm5ic3A7cHM6Jm5ic3A7SSZu
YnNwO3dhbnQmbmJzcDt0byZuYnNwO3VzZSZuYnNwO2EmbmJzcDtkeW1haWMmbmJzcDtkb21haW4m
bmJzcDt0byZuYnNwO2ZpeCZuYnNwO2l0Jm5ic3A7YnV0Jm5ic3A7ZmFpbGVkLiZuYnNwO0lmJm5i
c3A7c29tZW9uZSZuYnNwO2tub3csPGJyPiZndDsmbmJzcDtwbGVhc2UmbmJzcDt0ZWxsJm5ic3A7
bWUuJm5ic3A7QWxzbywmbmJzcDt0aGlzJm5ic3A7Y2FzZSZuYnNwO2ZhaWxlZCZuYnNwO3doZW4m
bmJzcDttZXJnaW5nJm5ic3A7dGhpcyZuYnNwO3BhdGNoJm5ic3A7YmVjYXVzZTxicj4mZ3Q7Jm5i
c3A7dGVzdCZuYnNwOzEzJm5ic3A7KHRlc3RfYXNzaWduX3Jlc291cmNlcykmbmJzcDtyZXBvcnQm
bmJzcDtubyZuYnNwO3NwYWNlJm5ic3A7ZXJyb3ImbmJzcDthcyZuYnNwO2JlbG93Ojxicj4mZ3Q7
Jm5ic3A7Wzc1NDkzMC43NTc1ODVdJm5ic3A7bHRwX3RwY2k6Jm5ic3A7dGVzdC1jYXNlJm5ic3A7
MTM8YnI+Jmd0OyZuYnNwO1s3NTQ5MzAuNzU3NTg1XSZuYnNwO2x0cF90cGNpOiZuYnNwO2Fzc2ln
biZuYnNwO3Jlc291cmNlczxicj4mZ3Q7Jm5ic3A7Wzc1NDkzMC43NTc1ODVdJm5ic3A7bHRwX3Rw
Y2k6Jm5ic3A7YXNzaWduJm5ic3A7cmVzb3VyY2UmbmJzcDsjMDxicj4mZ3Q7Jm5ic3A7Wzc1NDkz
MC43NTc1ODZdJm5ic3A7bHRwX3RwY2k6Jm5ic3A7bmFtZSZuYnNwOz0mbmJzcDswMDAwOjAwOjA4
LjAsJm5ic3A7ZmxhZ3MmbmJzcDs9Jm5ic3A7MjYyNDAxLCZuYnNwO3N0YXJ0Jm5ic3A7MHhjMTQw
LCZuYnNwO2VuZCZuYnNwOzB4YzE3Zjxicj4mZ3Q7Jm5ic3A7Wzc1NDkzMC43NTc1ODZdJm5ic3A7
bHRwX3RwY2k6Jm5ic3A7YXNzaWduJm5ic3A7cmVzb3VyY2UmbmJzcDsjMTxicj4mZ3Q7Jm5ic3A7
Wzc1NDkzMC43NTc1ODddJm5ic3A7bHRwX3RwY2k6Jm5ic3A7bmFtZSZuYnNwOz0mbmJzcDswMDAw
OjAwOjA4LjAsJm5ic3A7ZmxhZ3MmbmJzcDs9Jm5ic3A7MjYyNjU2LCZuYnNwO3N0YXJ0Jm5ic3A7
MHhmZWJkNzAwMCwmbmJzcDtlbmQmbmJzcDsweGZlYmQ3ZmZmPGJyPiZndDsmbmJzcDtbNzU0OTMw
Ljc1NzU4N10mbmJzcDtsdHBfdHBjaTombmJzcDthc3NpZ24mbmJzcDtyZXNvdXJjZSZuYnNwOyMy
PGJyPiZndDsmbmJzcDtbNzU0OTMwLjc1NzU4N10mbmJzcDtsdHBfdHBjaTombmJzcDtuYW1lJm5i
c3A7PSZuYnNwOzAwMDA6MDA6MDguMCwmbmJzcDtmbGFncyZuYnNwOz0mbmJzcDswLCZuYnNwO3N0
YXJ0Jm5ic3A7MHgwLCZuYnNwO2VuZCZuYnNwOzB4MDxicj4mZ3Q7Jm5ic3A7Wzc1NDkzMC43NTc1
ODhdJm5ic3A7bHRwX3RwY2k6Jm5ic3A7YXNzaWduJm5ic3A7cmVzb3VyY2UmbmJzcDsjMzxicj4m
Z3Q7Jm5ic3A7Wzc1NDkzMC43NTc1ODhdJm5ic3A7bHRwX3RwY2k6Jm5ic3A7bmFtZSZuYnNwOz0m
bmJzcDswMDAwOjAwOjA4LjAsJm5ic3A7ZmxhZ3MmbmJzcDs9Jm5ic3A7MCwmbmJzcDtzdGFydCZu
YnNwOzB4MCwmbmJzcDtlbmQmbmJzcDsweDA8YnI+Jmd0OyZuYnNwO1s3NTQ5MzAuNzU3NTg4XSZu
YnNwO2x0cF90cGNpOiZuYnNwO2Fzc2lnbiZuYnNwO3Jlc291cmNlJm5ic3A7IzQ8YnI+Jmd0OyZu
YnNwO1s3NTQ5MzAuNzU3NTg5XSZuYnNwO2x0cF90cGNpOiZuYnNwO25hbWUmbmJzcDs9Jm5ic3A7
MDAwMDowMDowOC4wLCZuYnNwO2ZsYWdzJm5ic3A7PSZuYnNwOzUzODE5MDM0OCwmbmJzcDtzdGFy
dCZuYnNwOzB4ZmU4MGMwMDAsJm5ic3A7ZW5kJm5ic3A7MHhmZTgwZmZmZjxicj4mZ3Q7Jm5ic3A7
Wzc1NDkzMC43NTc1OTNdJm5ic3A7dmlydGlvLXBjaSZuYnNwOzAwMDA6MDA6MDguMDombmJzcDtC
QVImbmJzcDs0OiZuYnNwO25vJm5ic3A7c3BhY2UmbmJzcDtmb3ImbmJzcDtbbWVtJm5ic3A7c2l6
ZSZuYnNwOzB4MDAwMDQwMDAmbmJzcDs2NGJpdCZuYnNwO3ByZWZdPGJyPiZndDsmbmJzcDtbNzU0
OTMwLjc1NzU5NF0mbmJzcDt2aXJ0aW8tcGNpJm5ic3A7MDAwMDowMDowOC4wOiZuYnNwO0JBUiZu
YnNwOzQ6Jm5ic3A7ZmFpbGVkJm5ic3A7dG8mbmJzcDthc3NpZ24mbmJzcDtbbWVtJm5ic3A7c2l6
ZSZuYnNwOzB4MDAwMDQwMDAmbmJzcDs2NGJpdCZuYnNwO3ByZWY8YnI+Jmd0Ozxicj5IaSZuYnNw
O1h1LDxicj48YnI+RG8mbmJzcDt5b3UmbmJzcDttZWFuJm5ic3A7dGhhdCZuYnNwO3RoZSZuYnNw
O2ZpeCZuYnNwO3BhdGNoJm5ic3A7cmVzdWx0cyZuYnNwO2luJm5ic3A7dGhlJm5ic3A7ZmFpbHVy
ZSZuYnNwO29mJm5ic3A7c3VidGVzdCZuYnNwOzEzPzxicj5JZiZuYnNwO3NvLCZuYnNwO3dlJm5i
c3A7bWF5Jm5ic3A7bmVlZCZuYnNwO2EmbmJzcDtiZXR0ZXImbmJzcDtzb2x1dGlvbi48YnI+PGJy
PlRoYW5rcyw8YnI+WGlhbyZuYnNwO1lhbmc8YnI+PGJyPjxicj48YnI+LS0mbmJzcDs8YnI+TWFp
bGluZyZuYnNwO2xpc3QmbmJzcDtpbmZvOiZuYnNwO2h0dHBzOi8vbGlzdHMubGludXguaXQvbGlz
dGluZm8vbHRwPGJyPjwvZGl2Pg==
------=_Part_0_151453552.1585909602686--


--===============1285225606==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1285225606==--

