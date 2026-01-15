Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 687F0D239CE
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Jan 2026 10:38:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1768469887; h=mime-version :
 date : message-id : to : references : in-reply-to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=jSYPb/RbL3ounuJ5sWQTzNFaIq/DjHA02x0lE4Ut6WI=;
 b=phZVWY3boOfXQCTvxK4y2+36Xsn9URxJod1TtVpLjKnF5ijcgJzEzs1qhXqo5bKVHA1GE
 4I+3WRPA/AteNeJRkiv8MmbxSTXieQb0sPVwR0ZQCpUoCt0Cd7jRszebqsUbyvHz0wZn2d/
 K5STr4cea4w9np8bv387unKFmjmhtqg=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F384B3C9D40
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Jan 2026 10:38:06 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B96C33C9A5F
 for <ltp@lists.linux.it>; Thu, 15 Jan 2026 10:38:03 +0100 (CET)
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 38179600620
 for <ltp@lists.linux.it>; Thu, 15 Jan 2026 10:38:03 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-b87693c981fso137329766b.1
 for <ltp@lists.linux.it>; Thu, 15 Jan 2026 01:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1768469882; x=1769074682; darn=lists.linux.it;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1Dts8OeDQdbvwIwQ63vmG5Vl0brLnNJOY82Dbet3jak=;
 b=AoJzujKjX2tgio1dG/vPppSXGxdqZJYRV+tL0mQaLDm5LArDhxVCgM66eMZc1QNqnl
 FJEVLZGK+PFrbIr+v9hQreS4+1LTTWqFb9PbK1581OETnnGRqLhoUMQ7MED5zVJRGTWV
 yKDCOw7O48WR36trZXaaA4fcAIa762XdumaxcjL/oFQ4o6zGCVJOTTuoM2CRlwT43Sre
 QW6Vkt7YStLHW+wfvMMmEzYth63z9LGxSwaAEOSqhpkeuZNCDeb2ZCSZunqfOrU+pJov
 Mg2E7hQpimVaK0/plKmOAbFb8McS3gtKERf4B+jFo3Ls46S1JZYHqkYFcLw4SfYNA3NL
 4E8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768469882; x=1769074682;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1Dts8OeDQdbvwIwQ63vmG5Vl0brLnNJOY82Dbet3jak=;
 b=EQWALLGCHt+ubRfX3xBBIERMyDGx3l0LDNkRZrzrHhnq62X/pGhQT1UOMdc+mxiSFY
 vQYNC2YLNqsOVEzWHA+HaZvPaocyCAtHUOX8V74xWmoxhUUe22bsMk5MM0faxixSLJrf
 oc9AlUv2nYkR8DhH5MT4XNzWduUejgcC0iO6T349cEDAngsZHWdqBzB+AsPYt5wDOv/D
 laCu3+Th5Vd/X+KS9NZtCdR6ka44fV6w64NBa+HBdVKjQVwOXBEZDmmBYfpB6EqLJAqF
 skwaof5cMeuSbqss5tcsG4KGdCB64OH9n9iEdo2qbbFK5nkz48WJfGieuZkmSJricxQc
 34eQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAsa/1bRkjCYCxFbIP94VidZKlwa5rK+RorCAKbbsHYYg48+q8Phstvu+aANTsD5Lz0j4=@lists.linux.it
X-Gm-Message-State: AOJu0Yy1k8Os6popRzZG904HoH1QP71pKldxiDYa1c9oVEUk7p+nBrnm
 3N2uuLwMGklpcYqK+c52SAVNSE8cl1iywl8KYm0ZbqLKoxzZN+6+zWLVSLgTNj3/jJagvX+bQAn
 TjXyT+pU=
X-Gm-Gg: AY/fxX4QNESamasT/fg5XjToVnYjsrmYzKPkNuoNmxdsNqU/0cueIojZswAJmq6VuEi
 gpc63bJjFOVx/lcpEXNUj1eCWW2MST3XuCMGPkZc354ZI6AisxRL7g+0jC7S0hgh81N2kVnDn5B
 simIVkk6stfnDGN4Rt7/f+GZVrMA2n/w3FZxdPrnGMDMUGZlenF3dXAFzDV78ssYMiIS7FIOYOD
 XYhnEuzpqTLbTtmFCd4Ns1MhTHFEFt+RG4de1vRxFokbinUKm2SR0MiuAxXYpUHWdGSTDQ9xtuB
 DgyKfjqcG7WhgvuHUAp9ZvtwxfkUetzkCi5EufwahhasuRhajgre19w3bUtLyxdudwBYhw3sDUQ
 q0ftWGeRZBxXir4D1kZiK7lQ3wrAgHmxOydxMdcMRJu49ehwePuG2QZBzmtc2Upr6P+eEuiDLkO
 3+l3+mTCt+EmW9AHj+SHKQLmm84i+A9UxEx7gtb8XLusWKiBOD5a02wMeQHhN9u+9aC0MsJv2O6
 cV4QSA=
X-Received: by 2002:a17:907:6d27:b0:b83:3716:cd52 with SMTP id
 a640c23a62f3a-b87676a6a4bmr423510666b.24.1768469882489; 
 Thu, 15 Jan 2026 01:38:02 -0800 (PST)
Received: from localhost
 (p200300ef2f1649001c626999955e52c8.dip0.t-ipconnect.de.
 [2003:ef:2f16:4900:1c62:6999:955e:52c8])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6541209cadfsm2034349a12.34.2026.01.15.01.38.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jan 2026 01:38:02 -0800 (PST)
Mime-Version: 1.0
Date: Thu, 15 Jan 2026 10:38:01 +0100
Message-Id: <DFP293X2K7JS.5UW00YLFRX4R@suse.com>
To: "Li Wang" <liwang@redhat.com>
X-Mailer: aerc 0.18.2
References: <20260114133548.411077-1-pvorel@suse.cz>
 <DFOCQI9JL96T.HVZEHA37O52I@suse.com>
 <CAEemH2fxiAufSaRm9XOJNDh+FG-4ufVEPrjoYi58-ZdJ8oB8iw@mail.gmail.com>
In-Reply-To: <CAEemH2fxiAufSaRm9XOJNDh+FG-4ufVEPrjoYi58-ZdJ8oB8iw@mail.gmail.com>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,DMARC_PASS,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 1/1] kirk: Update to v3.2
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
From: Andrea Cervesato via ltp <ltp@lists.linux.it>
Reply-To: Andrea Cervesato <andrea.cervesato@suse.com>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!

On Thu Jan 15, 2026 at 9:08 AM CET, Li Wang wrote:
> Hi Andrea,
>
> A quick question on '--framework' changes in v3.2, since before we
> use Kirk with set 'ltp:root' to find the correct LTP installation path.
>   `kirk --framework ltp:root=${LTPDIR} --run-suite $RUNTEST -v
> --json-report $OUTPUTDIR/$RUNTEST.json`
>
> Aafter removing that --framework, I get an error when trying to use
> --env for the installation path.
>   `kirk  --evn LTPROOT=${LTPDIR} --run-suite $RUNTEST -v --json-report
> $OUTPUTDIR/$RUNTEST.json`
>
> ===== Log =====
> # ./kirk --env LTPROOT=/root/ltp-install/  --run-suite sched -v
> --json-report sched.json
> Host information
>
> Hostname:   dell-per430-09.gsslab.pek2.redhat.com
> Python:     3.12.12 (main, Jan  6 2026, 00:00:00) [GCC 14.3.1 20250617
> (Red Hat 14.3.1-2)]
> Directory:  /tmp/kirk.root/tmp1a062qkt
>
> Connecting to SUT: default
> Error: LTP folder doesn't exist: /opt/ltp
>
> Disconnecting from SUT: default
> Session stopped
>
> ==============
>

This is strange. The --env feature is taking info from shell and
updating its dictionary if it has been defined.

This is exactly why this ticket has been open. Too much confusion
between shell variables and --env parameter. We can't have 2 different
ways to set internal variables.

https://github.com/linux-test-project/kirk/issues/72

> But once I put the LTPROOT=${LTPDIR} env separately, it works well:
>   `LTPROOT=/root/ltp-install/  ./kirk  --run-suite sched -v
> --json-report sched.json`
>
> Did I miss something here, or is it a Kirk issue that should be fixed?


Please use this method that is more consistent, also for CI.

Thanks,
-- 
Andrea Cervesato
SUSE QE Automation Engineer Linux
andrea.cervesato@suse.com


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
