Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5113A3A68F7
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Jun 2021 16:27:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1EEA33C7219
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Jun 2021 16:27:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 268AA3C4C12
 for <ltp@lists.linux.it>; Mon, 14 Jun 2021 16:27:34 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 9D012140009D
 for <ltp@lists.linux.it>; Mon, 14 Jun 2021 16:27:33 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 233541FD33
 for <ltp@lists.linux.it>; Mon, 14 Jun 2021 14:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623680853;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3wnrLnnJn0jUKY9WXsoXbnOv+bkETC15g54b//SZRKQ=;
 b=dPn3b+MyWO+TdkOBgUlU54b0roR06dL5SdFLCGYi+cPsf694Fy2e10vyRy1Ss4H7+Ean56
 CMje0Ev1JNGHOQZ/iYz1Iwqtw9YmvKqKadmqtxUCXSlDV4u5EIm24yFhbUhc1hzfpw9OWV
 IWZbl6vUnQp7p7H+rBOZo0NYPdhEVSg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623680853;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3wnrLnnJn0jUKY9WXsoXbnOv+bkETC15g54b//SZRKQ=;
 b=g+0Opy2OWzn78oL4e1vI7ktVdh8CV3X+jPv9mRRqRfkCuAOrQyWTZuSZWwPOqSkPRLtCzH
 eijf98WGM9D/s6AA==
Received: from g78 (unknown [10.163.24.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id DFA5FA3B90;
 Mon, 14 Jun 2021 14:27:32 +0000 (UTC)
References: <20210614115638.25467-1-rpalethorpe@suse.com>
 <20210614115638.25467-3-rpalethorpe@suse.com> <YMdcgrabnou+u90I@pevik>
 <YMdfDZPxY7lZC8F0@pevik> <87r1h44j6k.fsf@suse.de>
User-agent: mu4e 1.4.15; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Petr Vorel <pvorel@suse.cz>
In-reply-to: <87r1h44j6k.fsf@suse.de>
Date: Mon, 14 Jun 2021 15:27:32 +0100
Message-ID: <87o8c84j3f.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH v3 2/2] Start libclang based analyzer and
 TEST() check
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


Richard Palethorpe <rpalethorpe@suse.de> writes:

> Hello,
>
> Petr Vorel <pvorel@suse.cz> writes:
>
>> Hi Richie,
>>
>>> Hi Richie,
>>
>>> > +#if HAVE_CLANG_C_INDEX_H
>>> > +
>>> > +#include <clang-c/Index.h>
>>> ...
>>
>>> > +static void emit_error(const char *const error_msg)
>>> > +{
>>> > +	if (color_enabled(STDERR_FILENO)) {
>>> > +		dprintf(STDERR_FILENO,
>>> > +			"%sERROR%s: %s%s%s\n",
>>> > +			ansi_red, ansi_reset,
>>> > +			ansi_bold, error_msg, ansi_reset);
>>> > +	} else {
>>> > +		dprintf(STDERR_FILENO, "ERROR: %s\n", error_msg);
>>> > +	}
>>> > +}
>>> ...
>>> > +	if (ret != CXError_Success) {
>>> > +		emit_error("Failed to parse translation unit!");
>>> > +		return 1;
>>> > +	}
>>> ...
>>
>>> > +#else
>>> > +
>>> > +int main(const attr_unused int argc, const attr_unused char *const *const argv)
>>> > +{
>>> > +	emit_error("clang-checks was not built correctly; libclang headers are not installed!\n");
>>> emit_error() is not visible here, thus build fails. Please add it
>>before HAVE_CLANG_C_INDEX_H.
>
> +1
>
> Uhg.
>
>>
>>> Or you could just use tst_test.h with TST_NO_DEFAULT_MAIN and here would be TST_TEST_TCONF()
>>> (+ LTP_ATTRIBUTE_UNUSED).
>>
>> ...
>>> > +/* Copied from lib/tst_ansi_color.c */
>>> > +static int color_enabled(const int fd)
>>
>> Also you'd probably get tst_color_enabled() and other things from
>> lib/tst_ansi_color.c for color handling for free when using
>> tst_test.h.
>
> We would probably have to build the ltplib with HOSTCC. I don't think we
> can just include the headers.
>
> It is tempting, but it also seems very circular. I can imagine someone
> half refactoring a library and wanting to run the checks on one
> translation unit. However Make would detect a dependency has changed, so
> would try to rebuild the checker with a broken ltplib...
>
> We could probably make it work, but having the checker depend on the
> thing it checks seems like a recipe for complication. Meanwhile we just
> get to share a few macros and string constants.

Although we could create a tools lib with shared code for the meta data
parser and maybe the future parallel executor if that does not use the
test lib.

>
>>
>> But that's just a minor detail.
>>
>> Kind regards,
>> Petr
>>
>>> Kind regards,
>>> Petr
>>
>>> > +	return 1;
>>> > +}
>>> > +
>>> > +#endif


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
