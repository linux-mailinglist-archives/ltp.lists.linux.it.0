Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AB137182E8D
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Mar 2020 12:03:51 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D4AAB3C5EB0
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Mar 2020 12:03:50 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 815F13C5E61
 for <ltp@lists.linux.it>; Thu, 12 Mar 2020 12:03:46 +0100 (CET)
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id BBF7F601DB3
 for <ltp@lists.linux.it>; Thu, 12 Mar 2020 12:03:45 +0100 (CET)
Received: by mail-pg1-x544.google.com with SMTP id m15so2893755pgv.12
 for <ltp@lists.linux.it>; Thu, 12 Mar 2020 04:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=tlqEusurQ0MXZ3RFcRD/hmiDj761YwGx536gU6gfNyY=;
 b=tyGADuTLsAiDOZ4JfgY0GRRaiB9rAFfDjAVKVv0IdAU1TjHmcgu/pOxxhATXaUwk97
 MH0rpALXRva/ykV6yIUZUofvoudy7Nb/2wnQ3a0I936eVUQ4KJ5sj8cLPyd4bBEuZvJt
 Odq6so+KYFqrTkTTDJ9WVoOYs2cHEheFc5jStJTDJjaI2tAm/ff9ElmwDeO8mKKMtA2n
 Uki22o+f2so7+B/77HDKKd7WtZKjN4j7+wmXtmk8xMWQezBtmmckuYF6LN43xNx8+wud
 LxqpCPWv/vjwwhTqUsZE9FLiXtTwdzdw04wRjHEduv1G4h9Hta8woLKjfBo9Hy95eDXR
 me2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=tlqEusurQ0MXZ3RFcRD/hmiDj761YwGx536gU6gfNyY=;
 b=uVVszxkVWpH2m0BXoi/fVAf3sCA/ruhAEv49OlAJY+Ou3JIMiBznjleF9BdihY9tSe
 iK0p0pivWqUGGy06DgZBWUNwGB7pRbn14jeh+iznqElp/Qi01sx63tLWmwJWh53wnP8+
 z4ypRbLrw69/Rjk+HShw96+lT/8/ER3iK68i/db7AlKIIqoiwAE2M/kD67V/dPfnCBhw
 AZSxxyThl7VcBLtlUe8LOcfRbbKJZdl2lNzchwuW5AH9Eb/ye1dAc91iehq7xClHll8/
 EOkuqbBzhBaYDuH83+GYq4JCxkyOYSwhqJfAlgGh7124olTGl49KNMj+awnbbBX6sYc5
 UpBQ==
X-Gm-Message-State: ANhLgQ3g3EzIh8m0exuFOiZ13+QCyYCQZlrWKY1Dte2a6rNxsKySYUjE
 fDlU0C0IgLGviOW4rUW8AlnyVA==
X-Google-Smtp-Source: ADFU+vs8vXip/UmAm2Ff/Ns/OemnFY5m4ilq/PUIwxTubDsSveZ/0wpQ4Dk1ECZv/woDd85cziUrUg==
X-Received: by 2002:a63:7311:: with SMTP id o17mr7011337pgc.377.1584011024199; 
 Thu, 12 Mar 2020 04:03:44 -0700 (PDT)
Received: from localhost ([122.171.122.128])
 by smtp.gmail.com with ESMTPSA id v123sm29893249pfv.146.2020.03.12.04.03.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 12 Mar 2020 04:03:43 -0700 (PDT)
Date: Thu, 12 Mar 2020 16:33:40 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200312110340.y7mcfktrlgyzfui6@vireshk-i7>
References: <cover.1582779464.git.viresh.kumar@linaro.org>
 <2071e47d7d8cb3e7f8bc6558e86999eddd9c3762.1582779464.git.viresh.kumar@linaro.org>
 <20200306124546.GA3375@rei.lan>
 <CAEemH2drJyp5kU21jS7Ej+-q6hTysb5oDNM+3KiWsmPoLAbMQA@mail.gmail.com>
 <20200311102620.GB3802@rei.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200311102620.GB3802@rei.lan>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V5 01/10] tst_device: Add tst_is_mounted() helper
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, Vikas.Kumar2@arm.com,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 11-03-20, 11:26, Cyril Hrubis wrote:
> Hmm, for that we have to have compose the path for the comparsion
> anyways, since unless we pass an absoule path we can never be user if we
> have a right match or not. There may be leftover mount points from a
> failed tests that have faile to cleanup properly as well.
> 
> So I guess that we need one more function, with tmpdir in name, that
> would compose the right path for us and then call the tst_is_mntpoint().
> 
> I would have called that:
> 
> int tst_is_mntpoint_at_tmpdir(const char *path);

Is everyone fine with this code now :)

int tst_is_mounted(const char *path)
{
        char line[PATH_MAX];
        FILE *file;
        int ret = 0;

        file = SAFE_FOPEN(NULL, "/proc/mounts", "r");

        while (fgets(line, sizeof(line), file)) {
                if (strstr(line, path) != NULL) {
                        ret = 1;
                        break;
                }
        }

        SAFE_FCLOSE(NULL, file);

        if (!ret)
                tst_resm(TINFO, "No device is mounted at %s", path);

        return ret;
}

int tst_is_mounted_at_tmpdir(const char *path)
{
        char cdir[PATH_MAX], mpath[PATH_MAX];
        int ret;

        if (!getcwd(cdir, PATH_MAX))
                return 0;

        ret = snprintf(mpath, PATH_MAX, "%s/%s", cdir, path);
        if (ret < 0 || ret >= PATH_MAX)
                return 0;

        return tst_is_mounted(mpath);
}

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
