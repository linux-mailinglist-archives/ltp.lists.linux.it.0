Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E25296A06
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Oct 2020 09:01:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1E1AB3C5677
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Oct 2020 09:01:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 102EF3C23E0
 for <ltp@lists.linux.it>; Fri, 23 Oct 2020 09:01:46 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 9BEAB1000AE7
 for <ltp@lists.linux.it>; Fri, 23 Oct 2020 09:01:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603436504;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aYW3fs3RiEaHiacuoKXnkmbYCj/Ie5xRZ1NoKBXQ4vo=;
 b=jHayxLJiQCViTZ0FaSpF6qSSdNbuVrlQetFRwfQhctx23Cnqhqsazte1xmpHK/BAUeDi5i
 FzAvztLSn1CYtyGKBr4/t9cFOtp/86Xdva50xwL5G41mKFqZMJ3kA4HOHnhvktNWJw9g/r
 OrtyH/TQpkZ167KOHYP10OCsVHqTcjI=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-552-g-lxdg4mPlSrT2EYGq86vA-1; Fri, 23 Oct 2020 03:01:40 -0400
X-MC-Unique: g-lxdg4mPlSrT2EYGq86vA-1
Received: by mail-yb1-f197.google.com with SMTP id z3so805760yba.21
 for <ltp@lists.linux.it>; Fri, 23 Oct 2020 00:01:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aYW3fs3RiEaHiacuoKXnkmbYCj/Ie5xRZ1NoKBXQ4vo=;
 b=fsfx4rRkuBXOnTeJumZPMcp7+PYO+EY+dPT5d0JilZC0/bQ1tVoKizVm6dOXcWvTE4
 0c9Ojtft2lFf/C/XmE3J71+YDZcKYmyS5T1g2wCl0mKYnjHM1t5CAB4Yh3L4S6VbLSMv
 IYN1t9e/rkuXsvKLCkxS/BknUvdC+SsasCM/caW3RotlyO9rX/WnOvqTWHZlmezseoZZ
 SoHPvVic9OhhIaXGt3T1Bubww8k6lWyS3H355FpJBGDgh4UnqjpI9ot/hoJNNPL4voVQ
 rpChZ9q0A97VjJyDAuDOzn6xGngXOaUjKQXwqpyrGXISqgYT4wHDLPSSksPajtg4JGD2
 7kMQ==
X-Gm-Message-State: AOAM530h/hxwxVdi/b+nK1P2tRRGi7LuT0TbD/7QsusaNRHDClE7To7p
 sFRED24rTBXEvyrL9AcsToNx7dJJjO/AEcdMRGt/Hmaf7uO1Btg7JnUNEfh8wQATW17bMcjdolJ
 9Pl2DxaL0IXnxOXVJ1QgcTJ1ZM8Q=
X-Received: by 2002:a25:c7c6:: with SMTP id w189mr1484475ybe.403.1603436499516; 
 Fri, 23 Oct 2020 00:01:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz0agPt5MrjwKGXLvEHKhIYKiqNTPnIr7a4IzlsdaKwe6vCuJED2qGqizO8th4rvVfdvtzCbG7QuCG6Y4+2b0E=
X-Received: by 2002:a25:c7c6:: with SMTP id w189mr1484441ybe.403.1603436499242; 
 Fri, 23 Oct 2020 00:01:39 -0700 (PDT)
MIME-Version: 1.0
References: <20201005133054.23587-1-chrubis@suse.cz>
 <20201005133054.23587-4-chrubis@suse.cz>
In-Reply-To: <20201005133054.23587-4-chrubis@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Fri, 23 Oct 2020 15:01:27 +0800
Message-ID: <CAEemH2e397yh+sa68_YkHwEr+QAV+NC0ROhbXHUm0CvrEd9gng@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 03/11] docparse: Add test documentation parser
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
Cc: Cyril Hrubis <metan@ucw.cz>, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============0265947637=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0265947637==
Content-Type: multipart/alternative; boundary="000000000000f5254205b2512648"

--000000000000f5254205b2512648
Content-Type: text/plain; charset="UTF-8"

Cyril Hrubis <chrubis@suse.cz> wrote:

> +const char *next_token(FILE *f, struct data_node *doc)
> +{
> +       size_t i = 0;
> +       static char buf[4096];
> +       int c;
> +       int in_str = 0;
> +
> +       for (;;) {
> +               c = fgetc(f);
> +
> +               if (c == EOF)
> +                       goto exit;
> +
> +               if (in_str) {
> +                       if (c == '"') {
> +                               if (i == 0 || buf[i-1] != '\\')
> +                                       goto exit;
> +                       }

There is a problem in handle a special string token here,
which can not parse the "" correctly in many test cases.

e.g.

# ./docparse ../testcases/kernel/syscalls/fsopen/fsopen01.c
# ./docparse ../testcases/kernel/fs/ftest/ftest02.c
....

We got nothing output from the above two tests parsing because they
contains "" in their sentence, it makes next_token() exit too early.

     TEST(move_mount(fsmfd, "", AT_FDCWD, MNTPOINT,
            MOVE_MOUNT_F_EMPTY_PATH));


> +
> +                       buf[i++] = c;
> +                       continue;
> +               }
> +
> +               switch (c) {
> +               case '{':
> +               case '}':
> +               case ';':
> +               case '(':
> +               case ')':
> +               case '=':
> +               case ',':
> +               case '[':
> +               case ']':
> +                       if (i) {
> +                               ungetc(c, f);
> +                               goto exit;
> +                       }
> +
> +                       buf[i++]=c;
> +                       goto exit;
> +               case '0' ... '9':
> +               case 'a' ... 'z':
> +               case 'A' ... 'Z':
> +               case '.':
> +               case '_':
> +               case '-':
> +                       buf[i++]=c;
> +               break;
> +               case '/':
> +                       maybe_comment(f, doc);
> +               break;
> +               case '"':
> +                       in_str = 1;
> +               break;
> +               case ' ':
> +               case '\n':
> +               case '\t':
> +                       if (i)
> +                               goto exit;
> +               break;
> +               }
> +       }
> +
> +exit:
> +       if (i == 0)
> +               return NULL;
> +
> +       buf[i] = 0;
> +       return buf;
> +}
> +
> +#define WARN(str) fprintf(stderr, str "\n")
> +
> +static int parse_array(FILE *f, struct data_node *node)
> +{
> +       const char *token;
> +
> +       for (;;) {
> +               if (!(token = next_token(f, NULL)))
> +                       return 1;
> +
> +               if (!strcmp(token, "{")) {
> +                       struct data_node *ret = data_node_array();
> +                       parse_array(f, ret);
> +
> +                       if (data_node_array_len(ret))
> +                               data_node_array_add(node, ret);
> +                       else
> +                               data_node_free(ret);
> +
> +                       continue;
> +               }
> +
> +               if (!strcmp(token, "}"))
> +                       return 0;
> +
> +               if (!strcmp(token, ","))
> +                       continue;
> +
> +               if (!strcmp(token, "NULL"))
> +                       continue;
> +
> +               struct data_node *str = data_node_string(token);
> +
> +               data_node_array_add(node, str);
> +       }
> +
> +       return 0;
> +}
> +
> +static const char *tokens[] = {
> +       "static",
> +       "struct",
> +       "tst_test",
> +       "test",
> +       "=",
> +       "{",
> +};
> +
> +static struct data_node *parse_file(const char *fname)
> +{
> +       int state = 0, found = 0;
> +       const char *token;
> +

Seems we'd better check the fname is valid before opening it.

       if (access(fname, F_OK)) {
               fprintf(stderr, "file %s is not exist\n", fname);
               return NULL;
       }

> +static const char *filter_out[] = {
> +       "test",
> +       "test_all",
> +       "setup",
> +       "cleanup",
> +       "tcnt",
> +       "mntpoint",
> +       "bufs",

I guess the "options"  should be also filtered out here?

--
Regards,
Li Wang

--000000000000f5254205b2512648
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGJyPkN5cmlsIEhydWJpcyAmbHQ7PGEgaHJlZj0ibWFpbHRvOmNocnVi
aXNAc3VzZS5jeiI+Y2hydWJpc0BzdXNlLmN6PC9hPiZndDsgd3JvdGU6PGJyPjxicj4mZ3Q7ICtj
b25zdCBjaGFyICpuZXh0X3Rva2VuKEZJTEUgKmYsIHN0cnVjdCBkYXRhX25vZGUgKmRvYyk8YnI+
Jmd0OyArezxicj4mZ3Q7ICsgwqAgwqAgwqAgc2l6ZV90IGkgPSAwOzxicj4mZ3Q7ICsgwqAgwqAg
wqAgc3RhdGljIGNoYXIgYnVmWzQwOTZdOzxicj4mZ3Q7ICsgwqAgwqAgwqAgaW50IGM7PGJyPiZn
dDsgKyDCoCDCoCDCoCBpbnQgaW5fc3RyID0gMDs8YnI+Jmd0OyArPGJyPiZndDsgKyDCoCDCoCDC
oCBmb3IgKDs7KSB7PGJyPiZndDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCBjID0gZmdldGMoZik7
PGJyPiZndDsgKzxicj4mZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgaWYgKGMgPT0gRU9GKTxi
cj4mZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgZ290byBleGl0Ozxicj4m
Z3Q7ICs8YnI+Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGlmIChpbl9zdHIpIHs8YnI+Jmd0
OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGlmIChjID09ICYjMzk7JnF1b3Q7
JiMzOTspIHs8YnI+Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIGlmIChpID09IDAgfHwgYnVmW2ktMV0gIT0gJiMzOTtcXCYjMzk7KTxicj4mZ3Q7ICsg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
Z290byBleGl0Ozxicj4mZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfTxi
cj48YnI+VGhlcmUgaXMgYSBwcm9ibGVtIGluIGhhbmRsZSBhIHNwZWNpYWwgc3RyaW5nIHRva2Vu
IGhlcmUsPGJyPndoaWNoIGNhbiBub3QgcGFyc2UgdGhlICZxdW90OyZxdW90OyBjb3JyZWN0bHkg
aW4gbWFueSB0ZXN0IGNhc2VzLjxkaXY+PGJyPjwvZGl2PjxkaXY+ZS5nLjxicj48YnI+IyAuL2Rv
Y3BhcnNlIC4uL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvZnNvcGVuL2Zzb3BlbjAxLmM8YnI+
IyAuL2RvY3BhcnNlIC4uL3Rlc3RjYXNlcy9rZXJuZWwvZnMvZnRlc3QvZnRlc3QwMi5jPGRpdj4u
Li4uPGJyPjxicj5XZSBnb3Qgbm90aGluZzxzcGFuIGNsYXNzPSJnbWFpbF9kZWZhdWx0IiBzdHls
ZT0iZm9udC1zaXplOnNtYWxsIj4gb3V0cHV0PC9zcGFuPiBmcm9tIHRoZSBhYm92ZSB0d28gdGVz
dHMgcGFyc2luZyBiZWNhdXNlIHRoZXk8YnI+Y29udGFpbnMgJnF1b3Q7JnF1b3Q7IGluIHRoZWly
IHNlbnRlbmNlLCBpdCBtYWtlcyBuZXh0X3Rva2VuKCkgZXhpdCB0b28gZWFybHkuPC9kaXY+PGRp
dj48YnI+PGRpdj7CoMKgIMKgIFRFU1QobW92ZV9tb3VudChmc21mZCwgJnF1b3Q7JnF1b3Q7LCBB
VF9GRENXRCwgTU5UUE9JTlQsIDxicj7CoCDCoCDCoCDCoCA8c3BhbiBjbGFzcz0iZ21haWxfZGVm
YXVsdCIgc3R5bGU9ImZvbnQtc2l6ZTpzbWFsbCI+wqAgwqAgPC9zcGFuPk1PVkVfTU9VTlRfRl9F
TVBUWV9QQVRIKSk7PGJyPjwvZGl2PjxkaXY+PGJyPjxicj4mZ3Q7ICs8YnI+Jmd0OyArIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGJ1ZltpKytdID0gYzs8YnI+Jmd0OyArIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGNvbnRpbnVlOzxicj4mZ3Q7ICsgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgfTxicj4mZ3Q7ICs8YnI+Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHN3
aXRjaCAoYykgezxicj4mZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgY2FzZSAmIzM5O3smIzM5
Ozo8YnI+Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGNhc2UgJiMzOTt9JiMzOTs6PGJyPiZn
dDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCBjYXNlICYjMzk7OyYjMzk7Ojxicj4mZ3Q7ICsgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgY2FzZSAmIzM5OygmIzM5Ozo8YnI+Jmd0OyArIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIGNhc2UgJiMzOTspJiMzOTs6PGJyPiZndDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDC
oCBjYXNlICYjMzk7PSYjMzk7Ojxicj4mZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgY2FzZSAm
IzM5OywmIzM5Ozo8YnI+Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGNhc2UgJiMzOTtbJiMz
OTs6PGJyPiZndDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCBjYXNlICYjMzk7XSYjMzk7Ojxicj4m
Z3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgaWYgKGkpIHs8YnI+Jmd0OyAr
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHVuZ2V0YyhjLCBm
KTs8YnI+Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IGdvdG8gZXhpdDs8YnI+Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIH08
YnI+Jmd0OyArPGJyPiZndDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBidWZb
aSsrXT1jOzxicj4mZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgZ290byBl
eGl0Ozxicj4mZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgY2FzZSAmIzM5OzAmIzM5OyAuLi4g
JiMzOTs5JiMzOTs6PGJyPiZndDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCBjYXNlICYjMzk7YSYj
Mzk7IC4uLiAmIzM5O3omIzM5Ozo8YnI+Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGNhc2Ug
JiMzOTtBJiMzOTsgLi4uICYjMzk7WiYjMzk7Ojxicj4mZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgY2FzZSAmIzM5Oy4mIzM5Ozo8YnI+Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGNhc2Ug
JiMzOTtfJiMzOTs6PGJyPiZndDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCBjYXNlICYjMzk7LSYj
Mzk7Ojxicj4mZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgYnVmW2krK109
Yzs8YnI+Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGJyZWFrOzxicj4mZ3Q7ICsgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgY2FzZSAmIzM5Oy8mIzM5Ozo8YnI+Jmd0OyArIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIG1heWJlX2NvbW1lbnQoZiwgZG9jKTs8YnI+Jmd0OyArIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIGJyZWFrOzxicj4mZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgY2Fz
ZSAmIzM5OyZxdW90OyYjMzk7Ojxicj4mZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgaW5fc3RyID0gMTs8YnI+Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGJyZWFrOzxi
cj4mZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgY2FzZSAmIzM5OyAmIzM5Ozo8YnI+Jmd0OyAr
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIGNhc2UgJiMzOTtcbiYjMzk7Ojxicj4mZ3Q7ICsgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgY2FzZSAmIzM5O1x0JiMzOTs6PGJyPiZndDsgKyDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCBpZiAoaSk8YnI+Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGdvdG8gZXhpdDs8YnI+Jmd0OyArIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIGJyZWFrOzxicj4mZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfTxicj4mZ3Q7
ICsgwqAgwqAgwqAgfTxicj4mZ3Q7ICs8YnI+Jmd0OyArZXhpdDo8YnI+Jmd0OyArIMKgIMKgIMKg
IGlmIChpID09IDApPGJyPiZndDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCByZXR1cm4gTlVMTDs8
YnI+Jmd0OyArPGJyPiZndDsgKyDCoCDCoCDCoCBidWZbaV0gPSAwOzxicj4mZ3Q7ICsgwqAgwqAg
wqAgcmV0dXJuIGJ1Zjs8YnI+Jmd0OyArfTxicj4mZ3Q7ICs8YnI+Jmd0OyArI2RlZmluZSBXQVJO
KHN0cikgZnByaW50ZihzdGRlcnIsIHN0ciAmcXVvdDtcbiZxdW90Oyk8YnI+Jmd0OyArPGJyPiZn
dDsgK3N0YXRpYyBpbnQgcGFyc2VfYXJyYXkoRklMRSAqZiwgc3RydWN0IGRhdGFfbm9kZSAqbm9k
ZSk8YnI+Jmd0OyArezxicj4mZ3Q7ICsgwqAgwqAgwqAgY29uc3QgY2hhciAqdG9rZW47PGJyPiZn
dDsgKzxicj4mZ3Q7ICsgwqAgwqAgwqAgZm9yICg7Oykgezxicj4mZ3Q7ICsgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgaWYgKCEodG9rZW4gPSBuZXh0X3Rva2VuKGYsIE5VTEwpKSk8YnI+Jmd0OyArIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHJldHVybiAxOzxicj4mZ3Q7ICs8YnI+Jmd0
OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGlmICghc3RyY21wKHRva2VuLCAmcXVvdDt7JnF1b3Q7
KSkgezxicj4mZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgc3RydWN0IGRh
dGFfbm9kZSAqcmV0ID0gZGF0YV9ub2RlX2FycmF5KCk7PGJyPiZndDsgKyDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCBwYXJzZV9hcnJheShmLCByZXQpOzxicj4mZ3Q7ICs8YnI+Jmd0
OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGlmIChkYXRhX25vZGVfYXJyYXlf
bGVuKHJldCkpPGJyPiZndDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCBkYXRhX25vZGVfYXJyYXlfYWRkKG5vZGUsIHJldCk7PGJyPiZndDsgKyDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBlbHNlPGJyPiZndDsgKyDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBkYXRhX25vZGVfZnJlZShyZXQpOzxicj4mZ3Q7
ICs8YnI+Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGNvbnRpbnVlOzxi
cj4mZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfTxicj4mZ3Q7ICs8YnI+Jmd0OyArIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIGlmICghc3RyY21wKHRva2VuLCAmcXVvdDt9JnF1b3Q7KSk8YnI+Jmd0
OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHJldHVybiAwOzxicj4mZ3Q7ICs8
YnI+Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGlmICghc3RyY21wKHRva2VuLCAmcXVvdDss
JnF1b3Q7KSk8YnI+Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGNvbnRp
bnVlOzxicj4mZ3Q7ICs8YnI+Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGlmICghc3RyY21w
KHRva2VuLCAmcXVvdDtOVUxMJnF1b3Q7KSk8YnI+Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIGNvbnRpbnVlOzxicj4mZ3Q7ICs8YnI+Jmd0OyArIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIHN0cnVjdCBkYXRhX25vZGUgKnN0ciA9IGRhdGFfbm9kZV9zdHJpbmcodG9rZW4pOzxi
cj4mZ3Q7ICs8YnI+Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGRhdGFfbm9kZV9hcnJheV9h
ZGQobm9kZSwgc3RyKTs8YnI+Jmd0OyArIMKgIMKgIMKgIH08YnI+Jmd0OyArPGJyPiZndDsgKyDC
oCDCoCDCoCByZXR1cm4gMDs8YnI+Jmd0OyArfTxicj4mZ3Q7ICs8YnI+Jmd0OyArc3RhdGljIGNv
bnN0IGNoYXIgKnRva2Vuc1tdID0gezxicj4mZ3Q7ICsgwqAgwqAgwqAgJnF1b3Q7c3RhdGljJnF1
b3Q7LDxicj4mZ3Q7ICsgwqAgwqAgwqAgJnF1b3Q7c3RydWN0JnF1b3Q7LDxicj4mZ3Q7ICsgwqAg
wqAgwqAgJnF1b3Q7dHN0X3Rlc3QmcXVvdDssPGJyPiZndDsgKyDCoCDCoCDCoCAmcXVvdDt0ZXN0
JnF1b3Q7LDxicj4mZ3Q7ICsgwqAgwqAgwqAgJnF1b3Q7PSZxdW90Oyw8YnI+Jmd0OyArIMKgIMKg
IMKgICZxdW90O3smcXVvdDssPGJyPiZndDsgK307PGJyPiZndDsgKzxicj4mZ3Q7ICtzdGF0aWMg
c3RydWN0IGRhdGFfbm9kZSAqcGFyc2VfZmlsZShjb25zdCBjaGFyICpmbmFtZSk8YnI+Jmd0OyAr
ezxicj4mZ3Q7ICsgwqAgwqAgwqAgaW50IHN0YXRlID0gMCwgZm91bmQgPSAwOzxicj4mZ3Q7ICsg
wqAgwqAgwqAgY29uc3QgY2hhciAqdG9rZW47PGJyPiZndDsgKzxicj48YnI+U2VlbXMgd2UmIzM5
O2QgYmV0dGVyIGNoZWNrIHRoZSBmbmFtZSBpcyB2YWxpZCBiZWZvcmUgb3BlbmluZyBpdC48YnI+
PGJyPsKgIMKgIMKgIMKgaWYgKGFjY2VzcyhmbmFtZSwgRl9PSykpIHs8YnI+wqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBmcHJpbnRmKHN0ZGVyciwgJnF1b3Q7ZmlsZSAlcyBpcyBub3QgZXhpc3RcbiZx
dW90OywgZm5hbWUpOzxicj7CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJldHVybiBOVUxMOzxicj7C
oCDCoCDCoCDCoH08YnI+PGJyPiZndDsgK3N0YXRpYyBjb25zdCBjaGFyICpmaWx0ZXJfb3V0W10g
PSB7PGJyPiZndDsgKyDCoCDCoCDCoCAmcXVvdDt0ZXN0JnF1b3Q7LDxicj4mZ3Q7ICsgwqAgwqAg
wqAgJnF1b3Q7dGVzdF9hbGwmcXVvdDssPGJyPiZndDsgKyDCoCDCoCDCoCAmcXVvdDtzZXR1cCZx
dW90Oyw8YnI+Jmd0OyArIMKgIMKgIMKgICZxdW90O2NsZWFudXAmcXVvdDssPGJyPiZndDsgKyDC
oCDCoCDCoCAmcXVvdDt0Y250JnF1b3Q7LDxicj4mZ3Q7ICsgwqAgwqAgwqAgJnF1b3Q7bW50cG9p
bnQmcXVvdDssPGJyPiZndDsgKyDCoCDCoCDCoCAmcXVvdDtidWZzJnF1b3Q7LDxicj48YnI+SSBn
dWVzcyB0aGUgJnF1b3Q7b3B0aW9ucyZxdW90OyDCoHNob3VsZDxzcGFuIGNsYXNzPSJnbWFpbF9k
ZWZhdWx0IiBzdHlsZT0iZm9udC1zaXplOnNtYWxsIj7CoDwvc3Bhbj5iZTxzcGFuIGNsYXNzPSJn
bWFpbF9kZWZhdWx0IiBzdHlsZT0iZm9udC1zaXplOnNtYWxsIj48L3NwYW4+IDxzcGFuIGNsYXNz
PSJnbWFpbF9kZWZhdWx0IiBzdHlsZT0iZm9udC1zaXplOnNtYWxsIj5hbHNvIDwvc3Bhbj5maWx0
ZXJlZCBvdXQgaGVyZT88YnI+PGJyPi0tPGJyPlJlZ2FyZHMsPGJyPkxpIFdhbmc8L2Rpdj48L2Rp
dj48L2Rpdj48L2Rpdj4NCg==
--000000000000f5254205b2512648--


--===============0265947637==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0265947637==--

