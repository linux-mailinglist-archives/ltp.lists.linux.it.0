Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1606B64D
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Jul 2019 08:11:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C61B73C1D32
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Jul 2019 08:11:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id B62233C1770
 for <ltp@lists.linux.it>; Wed, 17 Jul 2019 08:10:57 +0200 (CEST)
Received: from mail-yw1-xc41.google.com (mail-yw1-xc41.google.com
 [IPv6:2607:f8b0:4864:20::c41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 7A145100153C
 for <ltp@lists.linux.it>; Wed, 17 Jul 2019 08:10:51 +0200 (CEST)
Received: by mail-yw1-xc41.google.com with SMTP id g19so9465731ywe.2
 for <ltp@lists.linux.it>; Tue, 16 Jul 2019 23:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=atFV1WDk05iZzoY5nVb7SY4nCkudEErauFeuW3Ze4zI=;
 b=bR/1v2BqeolnlnG/7xjilPJzug7Tw2rTr4mAiwYbdVQCADl3mYGpMC24rtOiRg/p20
 K/VpEXTpcB1Pgd7qxCzlhWNRO5rv75eY6x0HfI2P1N7ZW6VSp7TmAIe0xtiyTAbwxonm
 3ZzkLJ0Vra93vn7aKaJa0lmBuD4QBC+oAxIgBbdTb9cnx1neO0XLJ9ByfimxYdGq0fcl
 R3fXA4yhNtQJkcZs50A34LHXcrz2kevhM76hvMl75jeUaqb/n7d9sUizwAGIq3Z/udtH
 dXymXxLaYwV35rGqy94+f6Gk2gHw7z9CLBrBYeMpF2/wJfHRv36uCW/bS+PNxNXYcJFm
 QFKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=atFV1WDk05iZzoY5nVb7SY4nCkudEErauFeuW3Ze4zI=;
 b=nMyNSK6g7aDzo3/3U63AvinvacJ1xHoqBuxSi/6K1HKLoMhonKnHb/xaJcaAMf3XDM
 R61BOhFJz7hXMGgKu9HATEBFUn6ZUfmjlqxtoKZeCAfiT49Nyok/VTMz8nIp6HLAQ13U
 KiyGMH/hcej2VnWihJEw1OX7nbxg8iVJH2q9pF4RPSKPkRLRiYEv1s6kSqI7fCl/82XX
 wYPQaIMPVDbrMwYPfYCCOmTWdVcfDJGt8tjFdsEZjAe+ZDg6MG8sPhW8ZwKukF86YF9M
 EMLpqkfe7xZvIY7zJDexpcKtve0L6wf+QebggNsAGFJcR7AYILas3RfwOhBi0jFNKuvl
 JioA==
X-Gm-Message-State: APjAAAVJc2PNi2C7iGk1bTBs6xpLlav7/ABy2f6ic/ZK6lKZ0w7iju77
 0U9Zj7jPfz/vHMBqd3WdloEu/KpXhYVhI7GL8qA=
X-Google-Smtp-Source: APXvYqyJdwpD0fGUaMf0E9KLTXYwn7oTr64z6fac+0fnAIlKn1Dd3CpWodivaJ/L5KPEvwU1igJsR5Cj+Isz/V8uMec=
X-Received: by 2002:a0d:ce84:: with SMTP id q126mr21001594ywd.88.1563343855296; 
 Tue, 16 Jul 2019 23:10:55 -0700 (PDT)
MIME-Version: 1.0
References: <5D25B05A.8000600@cn.fujitsu.com>
 <1562755997-5626-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20190710135710.GC5628@rei.lan> <5D26B44D.4010208@cn.fujitsu.com>
 <20190711125108.GB8709@rei> <5D2819B8.8050401@cn.fujitsu.com>
In-Reply-To: <5D2819B8.8050401@cn.fujitsu.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 17 Jul 2019 09:10:44 +0300
Message-ID: <CAOQ4uxjwrFRCYe8vT5yJEfDPHjOSB=MD85GeKX5xALyD4SWwnA@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Content-Type: multipart/mixed; boundary="000000000000284e0b058dda5b63"
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 1/3] lib: alter find_free_loopdev()
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
Cc: LTP List <ltp@lists.linux.it>
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--000000000000284e0b058dda5b63
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 12, 2019 at 8:26 AM Yang Xu <xuyang2018.jy@cn.fujitsu.com> wrote:
>
>
> > Hi!
> >>> This needs more changes than this.
> >>>
> >>> The problem here is that the function modifies dev_path which is
> >>> returned by tst_acquire_device() so if you call this function after
> >>> tst_acquire_device() it will rewrite the dev_path which means that the
> >>> test would end up with wrong device path in tst_device->dev.
> >>>
> >>> I guess that the easiest solution would be changing the function to get
> >>> buffer parameter which, when non-NULL, is filled with the path.
> >>>
> >>> I.e. the function prototype would became:
> >>>
> >>> int tst_find_free_loopdev(char *path, size_t path_len);
> >>>
> >>> And we would pass the dev_path inside of the tst_device.c and NULL from
> >>> the copy_file_range() tests.
> >> Hi Cyril
> >>
> >> This is a good comment. But I doubt why we don't use a set_devpath_flag todistinguish it.
> >> Or you have a future plan(in different directory ,/dev,/dev/loop/,/dev/block)?
> > Well you can add a flag to the function but that would be a bad design
> > as far as I can tell. It would still allowed for a user to modify the
> > library internal state by calling the tst_find_free_loopdev() with the
> > flag set.
> >
> Hi  Cyril
>
> Even we use int tst_find_free_loopdev(char *path, size_t path_len), user aslo can modify the internal state.
> I don't know how to limit it. Can you give some example code? If we set LTP_DEV in *tst_acquire_device__,
> we can pass dev and len to tst_find_free_loopdev(), but if we not set LTP_DEV, what can pass to tst_free_loopdev()?
>
>

I don't understand your concern.
Attached untested patch which implements Cyril's suggestion.

You may call tst_find_free_loopdev(NULL, 0) to get a free minor number
without changing lib internal state.

Thanks,
Amir.

--000000000000284e0b058dda5b63
Content-Type: text/x-patch; charset="US-ASCII"; name="ltp-tst_find_free_loopdev.patch"
Content-Disposition: attachment; filename="ltp-tst_find_free_loopdev.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_jy6uhtbb0>
X-Attachment-Id: f_jy6uhtbb0

RnJvbSAyNTQ2NTk3YmMyMzZkMDBkOTRkZmEwOGIzYzhhYzM1MjM3NzFiNjY1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBbWlyIEdvbGRzdGVpbiA8YW1pcjczaWxAZ21haWwuY29tPgpE
YXRlOiBXZWQsIDE3IEp1bCAyMDE5IDA5OjA3OjQ4ICswMzAwClN1YmplY3Q6IFtQQVRDSF0gdHN0
X2ZpbmRfZnJlZV9sb29wZGV2CgotLS0KIGxpYi90c3RfZGV2aWNlLmMgfCAyNiArKysrKysrKysr
KysrKy0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDEyIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2xpYi90c3RfZGV2aWNlLmMgYi9saWIvdHN0X2Rldmlj
ZS5jCmluZGV4IDY1ZmNjMTMzNy4uYzA1ZDYyNThhIDEwMDY0NAotLS0gYS9saWIvdHN0X2Rldmlj
ZS5jCisrKyBiL2xpYi90c3RfZGV2aWNlLmMKQEAgLTUzLDIyICs1MywyMiBAQCBzdGF0aWMgY29u
c3QgY2hhciAqZGV2X3ZhcmlhbnRzW10gPSB7CiAJIi9kZXYvYmxvY2svbG9vcCVpIgogfTsKIAot
c3RhdGljIGludCBzZXRfZGV2X3BhdGgoaW50IGRldikKK3N0YXRpYyBpbnQgc2V0X2Rldl9wYXRo
KGludCBkZXYsIGNoYXIgKnBhdGgsIHNpemVfdCBwYXRoX2xlbikKIHsKIAl1bnNpZ25lZCBpbnQg
aTsKIAlzdHJ1Y3Qgc3RhdCBzdDsKIAogCWZvciAoaSA9IDA7IGkgPCBBUlJBWV9TSVpFKGRldl92
YXJpYW50cyk7IGkrKykgewotCQlzbnByaW50ZihkZXZfcGF0aCwgc2l6ZW9mKGRldl9wYXRoKSwg
ZGV2X3ZhcmlhbnRzW2ldLCBkZXYpOworCQlzbnByaW50ZihwYXRoLCBwYXRoX2xlbiwgZGV2X3Zh
cmlhbnRzW2ldLCBkZXYpOwogCi0JCWlmIChzdGF0KGRldl9wYXRoLCAmc3QpID09IDAgJiYgU19J
U0JMSyhzdC5zdF9tb2RlKSkKKwkJaWYgKHN0YXQocGF0aCwgJnN0KSA9PSAwICYmIFNfSVNCTEso
c3Quc3RfbW9kZSkpCiAJCQlyZXR1cm4gMTsKIAl9CiAKIAlyZXR1cm4gMDsKIH0KIAotc3RhdGlj
IGludCBmaW5kX2ZyZWVfbG9vcGRldih2b2lkKQoraW50IHRzdF9maW5kX2ZyZWVfbG9vcGRldihj
aGFyICpwYXRoLCBzaXplX3QgcGF0aF9sZW4pCiB7CiAJaW50IGN0bF9mZCwgZGV2X2ZkLCByYywg
aTsKIAlzdHJ1Y3QgbG9vcF9pbmZvIGxvb3BpbmZvOwpAQCAtODAsOCArODAsMTAgQEAgc3RhdGlj
IGludCBmaW5kX2ZyZWVfbG9vcGRldih2b2lkKQogCQlyYyA9IGlvY3RsKGN0bF9mZCwgTE9PUF9D
VExfR0VUX0ZSRUUpOwogCQljbG9zZShjdGxfZmQpOwogCQlpZiAocmMgPj0gMCkgewotCQkJc2V0
X2Rldl9wYXRoKHJjKTsKLQkJCXRzdF9yZXNtKFRJTkZPLCAiRm91bmQgZnJlZSBkZXZpY2UgJyVz
JyIsIGRldl9wYXRoKTsKKwkJCWlmIChwYXRoKQorCQkJCXNldF9kZXZfcGF0aChyYywgcGF0aCwg
cGF0aF9sZW4pOworCQkJdHN0X3Jlc20oVElORk8sICJGb3VuZCBmcmVlIGxvb3AgZGV2aWNlICVk
ICgnJXMnKSIsCisJCQkJCXJjLCBwYXRoID86ICIiKTsKIAkJCXJldHVybiAwOwogCQl9CiAJCXRz
dF9yZXNtKFRJTkZPLCAiQ291bGRuJ3QgZmluZCBmcmVlIGxvb3AgZGV2aWNlIik7CkBAIC0xMDQs
MjIgKzEwNiwyMiBAQCBzdGF0aWMgaW50IGZpbmRfZnJlZV9sb29wZGV2KHZvaWQpCiAJICogT2xk
ZXIgd2F5IGlzIHRvIGl0ZXJhdGUgb3ZlciAvZGV2L2xvb3AlaSBhbmQgL2Rldi9sb29wLyVpIGFu
ZCB0cnkKIAkgKiBMT09QX0dFVF9TVEFUVVMgaW9jdGwoKSB3aGljaCBmYWlscyBmb3IgZnJlZSBs
b29wIGRldmljZXMuCiAJICovCi0JZm9yIChpID0gMDsgaSA8IDI1NjsgaSsrKSB7CisJZm9yIChp
ID0gMDsgcGF0aCAmJiBpIDwgMjU2OyBpKyspIHsKIAotCQlpZiAoIXNldF9kZXZfcGF0aChpKSkK
KwkJaWYgKCFzZXRfZGV2X3BhdGgoaSwgcGF0aCwgcGF0aF9sZW4pKQogCQkJY29udGludWU7CiAK
LQkJZGV2X2ZkID0gb3BlbihkZXZfcGF0aCwgT19SRE9OTFkpOworCQlkZXZfZmQgPSBvcGVuKHBh
dGgsIE9fUkRPTkxZKTsKIAogCQlpZiAoZGV2X2ZkIDwgMCkKIAkJCWNvbnRpbnVlOwogCiAJCWlm
IChpb2N0bChkZXZfZmQsIExPT1BfR0VUX1NUQVRVUywgJmxvb3BpbmZvKSA9PSAwKSB7Ci0JCQl0
c3RfcmVzbShUSU5GTywgIkRldmljZSAnJXMnIGluIHVzZSIsIGRldl9wYXRoKTsKKwkJCXRzdF9y
ZXNtKFRJTkZPLCAiRGV2aWNlICclcycgaW4gdXNlIiwgcGF0aCk7CiAJCX0gZWxzZSB7CiAJCQlp
ZiAoZXJybm8gIT0gRU5YSU8pCiAJCQkJY29udGludWU7Ci0JCQl0c3RfcmVzbShUSU5GTywgIkZv
dW5kIGZyZWUgZGV2aWNlICclcyciLCBkZXZfcGF0aCk7CisJCQl0c3RfcmVzbShUSU5GTywgIkZv
dW5kIGZyZWUgZGV2aWNlICclcyciLCBwYXRoKTsKIAkJCWNsb3NlKGRldl9mZCk7CiAJCQlyZXR1
cm4gMDsKIAkJfQpAQCAtMjc0LDcgKzI3Niw3IEBAIGNvbnN0IGNoYXIgKnRzdF9hY3F1aXJlX2Rl
dmljZV9fKHVuc2lnbmVkIGludCBzaXplKQogCQlyZXR1cm4gTlVMTDsKIAl9CiAKLQlpZiAoZmlu
ZF9mcmVlX2xvb3BkZXYoKSkKKwlpZiAodHN0X2ZpbmRfZnJlZV9sb29wZGV2KGRldl9wYXRoLCBz
aXplb2YoZGV2X3BhdGgpKSkKIAkJcmV0dXJuIE5VTEw7CiAKIAlpZiAoYXR0YWNoX2RldmljZShk
ZXZfcGF0aCwgREVWX0ZJTEUpKQotLSAKMi4xNy4xCgo=
--000000000000284e0b058dda5b63
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--000000000000284e0b058dda5b63--
